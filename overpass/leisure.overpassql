[out:json][timeout:25];
(
  nw["leisure"="*"]({{bbox}});
  nw["amenity"="arts_centre"]({{bbox}});
  nw["amenity"="casino"]({{bbox}});
  nw["amenity"="cinema"]({{bbox}});
  nw["amenity"="community_centre"]({{bbox}});
  nw["amenity"="gambling"]({{bbox}});
  nw["amenity"="love_hotel"]({{bbox}});
  nw["amenity"="night_club"]({{bbox}});
  nw["amenity"="planetarium"]({{bbox}});
  nw["amenity"="public_bookcase"]({{bbox}});
  nw["amenity"="social_centre"]({{bbox}});
  nw["amenity"="stripclub"]({{bbox}});
  nw["amenity"="studio"]({{bbox}});
  nw["amenity"="theatre"]({{bbox}});
);
out center;
