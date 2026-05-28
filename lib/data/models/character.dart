class Character {
  final int? id;
  final String? name;
  final String? ki;
  final String? maxKi;
  final String? race;
  final String? gender;
  final String? description;
  final String? image;
  final String? affiliation;

  const Character({
    this.id,
    this.name,
    this.ki,
    this.maxKi,
    this.race,
    this.gender,
    this.description,
    this.image,
    this.affiliation,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      ki: json['ki'] ?? '',
      maxKi: json['maxKi'] ?? '',
      race: json['race'] ?? '',
      gender: json['gender'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      affiliation: json['affiliation'] ?? '',
    );
  }
}
