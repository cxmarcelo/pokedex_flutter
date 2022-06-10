import 'package:pokedex_flutter/models/named_api_resource.dart';

class PokemonStat {
  final NamedApiResource? stat;
  final int? effort;
  final int? baseStat;

  const PokemonStat(
    this.stat,
    this.effort,
    this.baseStat,
  );

  factory PokemonStat.fromJson(Map<String, dynamic> json) {
    return PokemonStat(
      json["stat"] == null ? null : NamedApiResource.fromJson(json["stat"]),
      json["effort"],
      json["baseStat"],
    );
  }
}
