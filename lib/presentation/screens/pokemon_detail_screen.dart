import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/pokemon_detail/pokemon_detail_bloc.dart';

class PokemonDetailScreen extends StatefulWidget {
  final String name;
  final String url;

  const PokemonDetailScreen({super.key, required this.name, required this.url});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  void initState() {
    super.initState();
    // trigger fetch using bloc
    context.read<PokemonDetailBloc>().add(FetchPokemonDetail(url: widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: SafeArea(
        child: BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
          builder: (context, state) {
            if (state is PokemonDetailLoading || state is PokemonDetailInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PokemonDetailError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is PokemonDetailLoaded) {
              final d = state.detail;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    if (d.imageUrl != null) ...[
                      Image.network(d.imageUrl!, height: 160, width: 160),
                      const SizedBox(height: 12),
                    ],
                    Text(d.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text('Height', style: TextStyle(fontWeight: FontWeight.w600)),
                            const SizedBox(height: 6),
                            Text('${d.height}'),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Weight', style: TextStyle(fontWeight: FontWeight.w600)),
                            const SizedBox(height: 6),
                            Text('${d.weight}'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(child: SizedBox()),
                    const Text('Data from PokéAPI (https://pokeapi.co)', style: TextStyle(color: Colors.grey)),
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
