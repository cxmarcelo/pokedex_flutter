import 'package:pokedex_flutter/models/named_api_resource.dart';

class PokemonPage {
  
  final int count;
  final String next;
  final String previous;
  final List<NamedApiResource> results;

  const PokemonPage(this.count, this.next, this.previous, this.results);

  factory PokemonPage.fromJson(Map<String, dynamic> json) {
    List<dynamic> dynamicList = json['results'];
    List<NamedApiResource> list = dynamicList.map((item) => NamedApiResource.fromJson(item)).toList();

    return PokemonPage(
      json["count"],
      json["next"] ?? "",
      json["previous"] ?? "",
      list,
    );
  }
}
