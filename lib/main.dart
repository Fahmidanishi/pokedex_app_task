import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repository/pokemon_repository.dart';
import 'logic/pokemon_list/pokemon_list_bloc.dart';
import 'presentation/screens/pokemon_list_screen.dart';

void main() {
  runApp(const PokeApp());
}

class PokeApp extends StatelessWidget {
  const PokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = PokemonRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PokemonListBloc(repository: repository),
        ),
      ],
      child: MaterialApp(
        title: 'Pokédex',
        theme: ThemeData(primarySwatch: Colors.red),
        home: const PokemonListScreen(),
      ),
    );
  }
}
