import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/pokemon_list_item.dart';
import '../../data/repository/pokemon_repository.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';



class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final PokemonRepository repository;

  PokemonListBloc({required this.repository}) : super(PokemonListInitial()) {
    on<FetchPokemons>(_onFetchPokemons);
  }

  Future<void> _onFetchPokemons(
      FetchPokemons event,
      Emitter<PokemonListState> emit,
      ) async {
    emit(PokemonListLoading());
    try {
      final pokemons = await repository.fetchPokemonList();
      emit(PokemonListLoaded(pokemons: pokemons));
    } catch (e) {
      emit(PokemonListError(message: e.toString()));
    }
  }
}
