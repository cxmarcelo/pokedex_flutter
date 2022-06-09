import 'package:pokedex_flutter/models/named_api_resource.dart';
import 'package:pokedex_flutter/models/pokemon/pokemon_ability%20.dart';
import 'package:pokedex_flutter/models/pokemon/pokemon_held_item.dart';
import 'package:pokedex_flutter/models/pokemon/pokemon_move.dart';
import 'package:pokedex_flutter/models/pokemon/pokemon_sprites.dart';
import 'package:pokedex_flutter/models/pokemon/pokemon_stat.dart';
import 'package:pokedex_flutter/models/pokemon/pokemon_type.dart';
import 'package:pokedex_flutter/models/version_game_index.dart';

class Pokemon {
  final int? id;
  final String? name;
  final int? baseExperience;
  final int? height;
  final bool? isDefault;
  final int? order;
  final int? weight;
  final List<PokemonAbility>? abilities;
  final List<NamedApiResource>? forms;
  final List<VersionGameIndex>? gameIndices;
  final List<PokemonHeldItem>? heldItems;
  final String? locationAreaEncounters;
  final List<PokemonMove>? moves;
  final PokemonSprites? sprites;
  final NamedApiResource? species;
  final List<PokemonStat>? stats;
  final List<PokemonType>? types;

  const Pokemon(
    this.id,
    this.name,
    this.baseExperience,
    this.height,
    this.isDefault,
    this.order,
    this.weight,
    this.abilities,
    this.forms,
    this.gameIndices,
    this.heldItems,
    this.locationAreaEncounters,
    this.moves,
    this.sprites,
    this.species,
    this.stats,
    this.types,
  );

  factory Pokemon.fromJson(Map<String, dynamic> json) {

    List<dynamic> abilitiesDynamic = json['abilities'] ?? [];
    List<PokemonAbility> abilities = abilitiesDynamic.map((item) => PokemonAbility.fromJson(item)).toList();

    List<dynamic> formsDynamic = json['abilities'] ?? [];
    List<NamedApiResource> forms = formsDynamic.map((item) => NamedApiResource.fromJson(item)).toList();

    List<dynamic> gameIndicesDynamic = json['abilities'] ?? [];
    List<VersionGameIndex> gameIndices = gameIndicesDynamic.map((item) => VersionGameIndex.fromJson(item)).toList();

    List<dynamic> heldItemsDynamic = json['abilities'] ?? [];
    List<PokemonHeldItem> heldItems = heldItemsDynamic.map((item) => PokemonHeldItem.fromJson(item)).toList();

    List<dynamic> movesDynamic = json['abilities'] ?? [];
    List<PokemonMove> moves = movesDynamic.map((item) => PokemonMove.fromJson(item)).toList();

    List<dynamic> statsDynamic = json['abilities'] ?? [];
    List<PokemonStat> stats = statsDynamic.map((item) => PokemonStat.fromJson(item)).toList();
    
    List<dynamic> typesDynamic = json['abilities'] ?? [];
    List<PokemonType> types = typesDynamic.map((item) => PokemonType.fromJson(item)).toList();

    return Pokemon(
      json["id"],
      json["name"] ,
      json["baseExperience"],
      json["height"],
      json["isDefault"],
      json["order"],
      json["weight"],
      abilities,
      forms,
      gameIndices,
      heldItems,
      json["locationAreaEncounters"],
      moves,
      json["sprites"] == null ? null : PokemonSprites.fromJson(json["sprites"]) ,
      json["species"] == null ? null : NamedApiResource.fromJson(json["species"]),
      stats,
      types,
    );
  }
}
