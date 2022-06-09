import 'package:pokedex_flutter/models/named_api_resource.dart';

class PokemonHeldItemVersion {
  final NamedApiResource version;
  final int rarity;

  const PokemonHeldItemVersion(
    this.version,
    this.rarity,
  );

  factory PokemonHeldItemVersion.fromJson(Map<String, dynamic> json) {
    return PokemonHeldItemVersion(
      json["version"],
      json["rarity"],
    );
  }
}
