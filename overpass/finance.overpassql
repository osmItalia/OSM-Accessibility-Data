[out:json][timeout:25];
(
  nw["amenity"="atm"]({{bbox}});
  nw["amenity"="bank"]({{bbox}});
  nw["amenity"="bureau_de_change"]({{bbox}});
  nw["amenity"="post_office"]({{bbox}});
);
out center;
