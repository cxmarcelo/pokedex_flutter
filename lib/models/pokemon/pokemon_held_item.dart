import 'package:pokedex_flutter/models/named_api_resource.dart';
import 'package:pokedex_flutter/models/pokemon/pokemon_held_item_version.dart';

class PokemonHeldItem {

	final NamedApiResource? item;
	final List<PokemonHeldItemVersion>? versionDetails;
	
  const PokemonHeldItem(
    this.item,
    this.versionDetails
  );

  factory PokemonHeldItem.fromJson(Map<String, dynamic> json) {
    //List<PokemonHeldItemVersion> versionDetails = .map((item) => PokemonHeldItemVersion.fromJson(item)).toList();

    return PokemonHeldItem(
      json["item"],
      json['versionDetails'],
    );
  }

}