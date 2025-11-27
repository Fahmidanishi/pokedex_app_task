import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Import your main app class
import 'package:pokedex_app/main.dart';

void main() {
  testWidgets('App builds and renders PokemonListScreen', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const PokeApp());

    // Check that the home screen shows a widget from PokemonListScreen
    // For example, check that "Pokédex" title or any text exists.
    expect(find.text('Pokédex'), findsOneWidget);

    // Optional: if PokemonListScreen has buttons or list items, you can test them:
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();
  });
}
