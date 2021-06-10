[out:json][timeout:25];
(
  nw["office"="government"]({{bbox}});
  nw["amenity"="police"]({{bbox}});
  nw["amenity"="embassy"]({{bbox}});
  nw["amenity"="townhall"]({{bbox}});
  nw["office"="diplomatic"]({{bbox}});
);
out center;
