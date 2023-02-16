[out:json][timeout:25];
(
  nw["amenity"="college"]({{bbox}});
  nw["amenity"="driving_school"]({{bbox}});
  nw["amenity"="kindergarten"]({{bbox}});
  nw["amenity"="language_school"]({{bbox}});
  nw["amenity"="library"]({{bbox}});
  nw["amenity"="toy_library"]({{bbox}});
  nw["amenity"="music_school"]({{bbox}});
  nw["amenity"="university"]({{bbox}});
);
out center;
