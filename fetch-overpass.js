#!/usr/bin/node
/*
 * Script to pull data from OSM via Overpass Turbo
 *
 * takes each file in overpass directory and generates a geojson file ready to be loaded by the application
 *
 * optional params:
 * --bbox=45.50,9.17,45.52,9.21     - use a custom bbox
 * --name=transport.ql              - fetch only this file
 *
 *
 * by default the scripts tries to fetch all the layers
 *
 *
 * NOTE: if you run this script with npm and want to use optional params the correct syntax is:
 * npm run pull-data -- --name=example.ql --bbox=45,9,46,10
 *
 * * */

const fs = require('fs');
const queue = require('async/queue');
const fetch = require('query-overpass');
const yargs = require('yargs/yargs');
const { hideBin } = require('yargs/helpers');

const { argv } = yargs(hideBin(process.argv));
const fsPromise = fs.promises;

const BBOX = argv.bbox || '45.4881,9.1811,45.4953,9.1935';

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

function query(q) {
  return new Promise((res, rej) => {
    fetch(q, (error, data) => {
      if (error) {
        rej(error);
      } else {
        res(data);
      }
    });
  });
}

function postProcess(geojson) {
  geojson.features.forEach(f => {
    Object.keys(f.properties.tags).forEach(tag => {
      f.properties[tag] = f.properties.tags[tag];
    });
  });
}

const queueManager = queue(async function(task) {
  const fileContent = await fsPromise.readFile(`./overpass/${task}`, {
    encoding: 'utf8'
  });
  const q = fileContent.replace(/\{\{bbox\}\}/g, BBOX);
  let res = null;
  try {
    res = await query(q);
  } catch (e) {
    console.log('Error with overpass', e);
  }
  if (res) {
    postProcess(res);
    await fsPromise.writeFile(
      `./data/${task.replace('ql', 'geojson')}`,
      JSON.stringify(res),
      'utf8'
    );
  }
  // Prevent hitting the rate limit
  await sleep(10000);
  console.log('Done', task);
}, 1);

async function init() {
  const files = await fsPromise.readdir('./overpass/');
  files
    .filter(f => f.indexOf('ql') > 0)
    .forEach(f =>
      queueManager.push(f, e => {
        if (e) {
          console.log('task', f, e);
        }
      })
    );
  await queueManager.drain();
}

async function initOne(fname) {
  queueManager.push(fname, e => {
    if (e) {
      console.log(e);
    }
  });
  await queueManager.drain();
}

console.log('fetching data from overpass');

if (argv.name) {
  initOne(argv.name);
} else {
  init();
}
