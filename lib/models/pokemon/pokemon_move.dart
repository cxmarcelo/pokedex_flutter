import 'package:pokedex_flutter/models/named_api_resource.dart';
import 'package:pokedex_flutter/models/pokemon/pokemon_move_version.dart';

class PokemonMove {
  final NamedApiResource? moves;
  final List<PokemonMoveVersion>? versionGroupDetails;

  const PokemonMove(
    this.moves,
    this.versionGroupDetails,
  );

  factory PokemonMove.fromJson(Map<String, dynamic> json) {
    //List<PokemonMoveVersion> versionGroupDetails = .map((item) => PokemonMoveVersion.fromJson(item)).toList();

    return PokemonMove(
      json["moves"],
      json['versionGroupDetails'],
    );
  }
}
