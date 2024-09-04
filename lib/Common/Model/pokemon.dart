// import 'dart:ffi';

const String notLoaded = 'not loaded...';

class Pokemon {
  Pokemon({
    required this.id,
    required this.name,
    this.habitat,
    this.shape,
    this.color,
    this.sprites,
    this.types,
  });

  int id;
  String name;
  String? habitat;
  String? shape;
  String? color;
  String? sprites;
  List<String>? types;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json['id'],
        name: json['name'],
        habitat: json['habitat']['name'],
        shape: json['shape']['name'],
        color: json['color']['name'],
        sprites: json['sprites'],
        types: List<String>.from(json['types'].map((x) => x)),
      );

  toJson() {
    return {
      'id': id,
      'name': name,
      'habitat': habitat,
      'shape': shape,
      'color': color,
      'sprites': sprites,
      'types': types,
    };
  }

  Pokemon copyWith({
    int? id,
    String? name,
    String? habitat,
    String? shape,
    String? color,
    List<String>? abilities,
    String? sprites,
    List<String>? types,
  }) =>
      Pokemon(
        id: id ?? this.id,
        name: name ?? this.name,
        habitat: habitat ?? this.habitat,
        shape: shape ?? this.shape,
        color: color ?? this.color,
        sprites: sprites ?? this.sprites,
        types: types ?? this.types,
      );
}
