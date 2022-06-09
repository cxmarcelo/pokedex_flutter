import 'package:pokedex_flutter/models/named_api_resource.dart';

class PokemonMoveVersion {
  final NamedApiResource moveLearnMethod;
  final NamedApiResource versionGroup;
  final int levelLearnedAt;

  const PokemonMoveVersion(
    this.moveLearnMethod,
    this.versionGroup,
    this.levelLearnedAt,
  );

  factory PokemonMoveVersion.fromJson(Map<String, dynamic> json) {
    NamedApiResource moveLearnMethod = NamedApiResource.fromJson(json["moveLearnMethod"]);
    NamedApiResource versionGroup = NamedApiResource.fromJson(json["versionGroup"]);

    return PokemonMoveVersion(
      moveLearnMethod,
      versionGroup,
      json["levelLearnedAt"],
    );
  }
}
