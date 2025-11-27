class PokemonDetail {
  final String name;
  final int height;
  final int weight;
  final String? imageUrl;

  PokemonDetail({
    required this.name,
    required this.height,
    required this.weight,
    this.imageUrl,
  });

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {
    final sprites = json['sprites'] as Map<String, dynamic>?;

    return PokemonDetail(
      name: (json['name'] as String).capitalizeFirst(),
      height: json['height'] as int? ?? 0,
      weight: json['weight'] as int? ?? 0,
      imageUrl: sprites != null ? sprites['front_default'] as String? : null,
    );
  }
}

// use same capitalize helper
extension StringCap on String {
  String capitalizeFirst() {
    if (isEmpty) return this;
    return substring(0, 1).toUpperCase() + substring(1);
  }
}
