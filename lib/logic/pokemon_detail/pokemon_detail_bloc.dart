import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/pokemon_detail.dart';
import '../../data/repository/pokemon_repository.dart';

part 'pokemon_detail_event.dart';
part 'pokemon_detail_state.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  final PokemonRepository repository;

  PokemonDetailBloc({required this.repository})
      : super(PokemonDetailInitial()) {
    on<FetchPokemonDetail>(_onFetchPokemonDetail);
  }

  Future<void> _onFetchPokemonDetail(
      FetchPokemonDetail event, Emitter<PokemonDetailState> emit) async {
    emit(PokemonDetailLoading());
    try {
      final detail = await repository.fetchPokemonDetail(event.url);
      emit(PokemonDetailLoaded(detail: detail));
    } catch (e) {
      emit(PokemonDetailError(message: e.toString()));
    }
  }
}
