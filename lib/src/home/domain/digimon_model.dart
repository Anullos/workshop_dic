import 'dart:convert';

class DigimonModel {
  final String name;
  final String img;
  final String level;
  DigimonModel({
    required this.name,
    required this.img,
    required this.level,
  });

  DigimonModel copyWith({
    String? name,
    String? img,
    String? level,
  }) {
    return DigimonModel(
      name: name ?? this.name,
      img: img ?? this.img,
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'img': img,
      'level': level,
    };
  }

  factory DigimonModel.fromMap(Map<String, dynamic> map) {
    return DigimonModel(
      name: map['name'] as String,
      img: map['img'] as String,
      level: map['level'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DigimonModel.fromJson(String source) =>
      DigimonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DigimonModel(name: $name, img: $img, level: $level )';
  }

  @override
  bool operator ==(covariant DigimonModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.img == img && other.level == level;
  }

  @override
  int get hashCode {
    return name.hashCode ^ img.hashCode ^ level.hashCode;
  }
}
