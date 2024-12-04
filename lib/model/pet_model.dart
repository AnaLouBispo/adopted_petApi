class Pet {
  final String id;
  final String name;
  final int age;
  final double weight;
  final String color;
  final List<String> images;

  Pet({
    required this.id,
    required this.name,
    required this.age,
    required this.weight,
    required this.color,
    required this.images,
  });

  /// Converte um JSON em uma instância de [PetModel].
  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['_id'] as String? ?? 'Unknown', // Campo `_id`
      name: json['name'] as String? ?? 'Unknown',
      age: json['age'] as int? ?? 0,
      weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
      color: json['color'] as String? ?? 'Unknown',
      images: (json['images'] as List<dynamic>? ?? []).map((e) => e as String).toList(),
    );
  }

  /// Converte uma instância de [PetModel] em JSON.
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'age': age,
      'weight': weight,
      'color': color,
      'images': images,
    };
  }

  /// Retorna a URL da imagem principal (primeira imagem na lista).
  String get imageUrl {
    return images.isNotEmpty ? images[0] : ''; // Retorna a primeira imagem ou vazio
  }
}
