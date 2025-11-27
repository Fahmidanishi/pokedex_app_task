class PokemonListItem {
  final String name;
  final String url;

  PokemonListItem({required this.name, required this.url});

  factory PokemonListItem.fromJson(Map<String, dynamic> json) {
    return PokemonListItem(
      name: (json['name'] as String).capitalizeFirst(),
      url: json['url'] as String,
    );
  }
}

extension StringCap on String {
  String capitalizeFirst() {
    if (isEmpty) return this;
    return substring(0, 1).toUpperCase() + substring(1);
  }
}
