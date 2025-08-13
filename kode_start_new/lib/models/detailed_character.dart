class SeriesCharacter {
  SeriesCharacter({
    required this.id,
    required this.name,
    required this.image,
  });
  final int id;
  final String name;
  final String image;

  factory SeriesCharacter.fromJson(Map<String, dynamic> json) {
    return SeriesCharacter(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

class DetailedCharacter extends SeriesCharacter {
  DetailedCharacter({
    required super.id,
    required super.name,
    required super.image,
    required this.status,
    required this.species,
    required this.location,
    required this.origin,
  });

  final String status;
  final String species;
  final Location location;
  final Location origin;

  factory DetailedCharacter.fromJson(Map<String, dynamic> json) {
    return DetailedCharacter(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      location: Location.fromJson(json['location']),
      origin: Location.fromJson(json['origin']),
      image: json['image'],
    );
  }
}

class Location {
  Location({
    required this.name,
  });

  final String name;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
