import 'package:pokedex_flutter/models/named_api_resource.dart';

class PokemonAbility {
  final bool? isHidden;
  final int? slot;
  final NamedApiResource? ability;

  const PokemonAbility(
    this.isHidden,
    this.slot,
    this.ability,
  );

  factory PokemonAbility.fromJson(Map<String, dynamic> json) {
    NamedApiResource ability = NamedApiResource.fromJson(json["ability"]);

    return PokemonAbility(
      json["isHidden"],
      json["slot"],
      ability,
    );
  }
}
