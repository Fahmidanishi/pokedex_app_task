import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/data/repository/pokemon_repository.dart';

import '../models/pokemon_detail.dart';
import '../models/pokemon_list_item.dart';

class PokemonRepository {
  static const String baseListUrl =
      'https://pokeapi.co/api/v2/pokemon?limit=200&offset=0';

  final http.Client _client;

  PokemonRepository({http.Client? client})
      : _client = client ?? http.Client();

  Future<List<PokemonListItem>> fetchPokemonList() async {
    final response = await _client.get(Uri.parse(baseListUrl));

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch pokemon list');
    }

    final Map<String, dynamic> data = json.decode(response.body);
    final results = data['results'] as List<dynamic>;

    return results
        .map((e) => PokemonListItem.fromJson(e))
        .toList();
  }

  Future<PokemonDetail> fetchPokemonDetail(String url) async {
    final response = await _client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch pokemon detail');
    }

    return PokemonDetail.fromJson(json.decode(response.body));
  }
}
