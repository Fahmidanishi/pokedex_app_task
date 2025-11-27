part of 'pokemon_detail_bloc.dart';

abstract class PokemonDetailEvent extends Equatable {
  const PokemonDetailEvent();

  @override
  List<Object?> get props => [];
}

class FetchPokemonDetail extends PokemonDetailEvent {
  final String url;

  const FetchPokemonDetail({required this.url});

  @override
  List<Object?> get props => [url];
}
