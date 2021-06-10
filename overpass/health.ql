[out:json][timeout:25];
(
  nw["healthcare"="*"]({{bbox}});
  nw["amenity"="clinic"]({{bbox}});
  nw["amenity"="dentist"]({{bbox}});
  nw["amenity"="doctors"]({{bbox}});
  nw["amenity"="hospital"]({{bbox}});
  nw["amenity"="nursing_home"]({{bbox}});
  nw["amenity"="pharmacy"]({{bbox}});
  nw["amenity"="social_facility"]({{bbox}});
  nw["amenity"="veterinary"]({{bbox}});
  nw["amenity"="funeral_hall"]({{bbox}});
);
out center;
