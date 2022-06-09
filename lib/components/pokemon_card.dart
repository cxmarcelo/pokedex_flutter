import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/named_api_resource.dart';
import 'package:pokedex_flutter/models/pokemon/pokemon.dart';
import 'package:pokedex_flutter/services/pokemon_service.dart';

class PokemonCard extends StatefulWidget {
  final NamedApiResource pokemon;

  const PokemonCard(this.pokemon, {Key? key}) : super(key: key);

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  late Future<Pokemon> futurePokemon;

  @override
  void initState() {
    super.initState();
    print("Printando aqui");
    print(widget.pokemon.name);
    futurePokemon = PokemonService().findPokemons(widget.pokemon.name);
  }

  Widget getImage(Pokemon pokemon) {
    return Image(
      image: NetworkImage(pokemon.sprites?.front_default ?? ""),
      height: 115,
      errorBuilder: (context, error, stackTrace) => const Icon(
        Icons.cancel_outlined,
        color: Colors.white,
        size: 100.0,
      ),
    );
  }

  bool teste(Pokemon pokemon){
    print(pokemon.sprites!.front_default);
    if(pokemon.sprites != null) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: FutureBuilder<Pokemon>(
        future: futurePokemon,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.toString()),
            );
          } else if (snapshot.hasData) {
            return Column(
              children: [Text(snapshot.data!.name ?? "-"),
              teste(snapshot.data!) ? getImage(snapshot.data!) : Text("None"),
              ]
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
