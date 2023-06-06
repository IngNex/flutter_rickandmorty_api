class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Map origin;
  final Map location;
  final String image;
  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': origin,
      'location': location,
      'image': image,
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};

    map['id'] = id;
    map['name'] = name;
    map['status'] = status;
    map['species'] = species;
    map['type'] = type;
    map['gender'] = gender;
    map['origin'] = origin;
    map['location'] = location;
    map['image'] = image;
    return map;
  }
}
