[out:json][timeout:25];
(
  nw["amenity"="bar"]({{bbox}});
  nw["amenity"="bbq"]({{bbox}});
  nw["amenity"="biergarten"]({{bbox}});
  nw["amenity"="cafe"]({{bbox}});
  nw["amenity"="drinking_water"]({{bbox}});
  nw["amenity"="fast_food"]({{bbox}});
  nw["amenity"="ice_cream"]({{bbox}});
  nw["amenity"="pub"]({{bbox}});
  nw["amenity"="restaurant"]({{bbox}});
);
out center;
