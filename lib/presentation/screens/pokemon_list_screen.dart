import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/pokemon_list/pokemon_list_bloc.dart';
import '../../presentation/widgets/pokemon_card.dart';
import '../../data/repository/pokemon_repository.dart';
import '../../logic/pokemon_detail/pokemon_detail_bloc.dart';
import 'pokemon_detail_screen.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  @override
  void initState() {
    super.initState();
    // Trigger fetch
    context.read<PokemonListBloc>().add(FetchPokemons());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex'),
      ),
      body: SafeArea(
        child: BlocBuilder<PokemonListBloc, PokemonListState>(
          builder: (context, state) {
            if (state is PokemonListLoading || state is PokemonListInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PokemonListError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is PokemonListLoaded) {
              final pokemons = state.pokemons;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Text('Pokémon', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 110,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: pokemons.length,
                        itemBuilder: (context, index) {
                          final p = pokemons[index];
                          return PokemonCard(
                            name: p.name,
                            onTap: () {
                              final repository = PokemonRepository();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider(
                                    create: (_) => PokemonDetailBloc(repository: repository),
                                    child: PokemonDetailScreen(name: p.name, url: p.url),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: Center(
                        child: Text('Tap a Pokémon card to view details', style: TextStyle(color: Colors.grey[700])),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
