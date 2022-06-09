import 'package:flutter/material.dart';
import 'package:pokedex_flutter/components/pokemon_card.dart';
import 'package:pokedex_flutter/models/named_api_resource.dart';
import 'package:pokedex_flutter/models/pokemon/pokemon.dart';
import 'package:pokedex_flutter/services/pokemon_service.dart';

void main() {
  runApp(PokedexApp());
}

class PokedexApp extends StatefulWidget {
  @override
  State<PokedexApp> createState() => _PokedexAppState();
}

class _PokedexAppState extends State<PokedexApp> {
  bool requestError = false;

  late Future<List<NamedApiResource>> futurePokemon;

  @override
  void initState() {
    super.initState();
    futurePokemon = PokemonService().findPokemonsList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pokedex"),
        ),
        body: FutureBuilder<List<NamedApiResource>>(
          future: futurePokemon,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.toString()),
              );
            } else if (snapshot.hasData) {
              return GridView(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  padding: const EdgeInsets.all(15.0),
                  children:
                      snapshot.data!.map((poke) => PokemonCard(poke)).toList());
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
