import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/named_api_resource.dart';
import 'package:pokedex_flutter/models/pokemon/pokemon.dart';
import 'package:pokedex_flutter/services/pokemon_service.dart';
import 'package:pokedex_flutter/utils/pokemon_utils.dart';

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
    futurePokemon = PokemonService().findPokemons(widget.pokemon.name);
  }

  Widget getImage(Pokemon pokemon) {
    return Image(
      image: NetworkImage(pokemon.sprites?.front_default ?? ""),
      height: 60,
      errorBuilder: (context, error, stackTrace) => const Icon(
        Icons.cancel_outlined,
        color: Colors.white,
        size: 60.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Pokemon>(
      future: futurePokemon,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.toString()),
          );
        } else if (snapshot.hasData) {
          return Container(
            height: 45,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: PokemonUtils.getColors(snapshot.data!),
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(children: [
              getImage(snapshot.data!),
              Column(
                children: [
                  Text(
                    PokemonUtils.formatPokeId(snapshot.data!.id!.toString()),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    snapshot.data!.name!.toCapitalized(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ]),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
