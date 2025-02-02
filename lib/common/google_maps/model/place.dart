class Coordinate {
  final num lat;
  final num lng;

  Coordinate({required this.lat, required this.lng});

  factory Coordinate.fromJson(Map<String, dynamic> json) {
    return Coordinate(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  @override
  String toString() {
    return 'Coordinate${toJson()}';
  }
}

class Viewport {
  final Coordinate northeast;
  final Coordinate southwest;

  Viewport({required this.northeast, required this.southwest});

  factory Viewport.fromJson(Map<String, dynamic> json) {
    return Viewport(
      northeast: Coordinate.fromJson(json['northeast']),
      southwest: Coordinate.fromJson(json['southwest']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'northeast': northeast.toJson(),
      'southwest': southwest.toJson(),
    };
  }

  @override
  String toString() {
    return 'Viewport${toJson()}';
  }
}

class Geometry {
  final Coordinate location;
  final Viewport? viewport; // Nullable viewport

  Geometry({required this.location, this.viewport});

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(
      location: Coordinate.fromJson(json['location']),
      viewport: json['viewport'] != null
          ? Viewport.fromJson(json['viewport'])
          : null, // Handle nullable viewport
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location.toJson(),
      if (viewport != null) 'viewport': viewport!.toJson(),
    };
  }

  @override
  String toString() {
    return 'Geometry${toJson()}';
  }
}

class Place {
  final String name;
  final String formattedAddress;
  final Geometry? geometry; // Nullable geometry

  Place({
    required this.name,
    required this.formattedAddress,
    this.geometry, // Made geometry nullable
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'] ?? '',
      formattedAddress: json['formatted_address'] ?? '',
      geometry: json['geometry'] != null
          ? Geometry.fromJson(json['geometry'])
          : null, // Handle nullable geometry
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'formatted_address': formattedAddress,
      if (geometry != null) 'geometry': geometry!.toJson(),
    };
  }

  @override
  String toString() {
    return 'Place${toJson()}';
  }
}
