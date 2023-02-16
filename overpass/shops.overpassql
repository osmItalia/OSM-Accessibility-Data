[out:json][timeout:25];
(
  nw["shop"="*"]({{bbox}});
  nw["amenity"="marketplace"]({{bbox}});
);
out center;
