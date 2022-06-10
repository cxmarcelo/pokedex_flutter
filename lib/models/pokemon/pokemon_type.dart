import 'package:pokedex_flutter/models/named_api_resource.dart';

class PokemonType {
  final int? slot;
  final NamedApiResource? type;

  const PokemonType(
    this.slot,
    this.type,
  );

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(
      json["slot"],
      json["type"] == null ? null : NamedApiResource.fromJson(json["type"]),
    );
  }
}
