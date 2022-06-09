import 'dart:convert';

import 'package:pokedex_flutter/models/named_api_resource.dart';
import 'package:pokedex_flutter/models/pokemon/pokemon.dart';
import 'package:pokedex_flutter/models/pokemon/pokemon_page.dart';
import 'package:pokedex_flutter/utils/app_config.dart';
import 'package:http/http.dart' as http;

class PokemonService {
  Future<Pokemon> findPokemons(String name) async {
    final response =
        await http.get(Uri.parse("${AppConfig.pokeApiUrl}/pokemon/$name"));

    if (response.statusCode == 200) {
      dynamic body = jsonDecode(response.body);
      Pokemon pokemon = Pokemon.fromJson(body);
      /*List<Pokemon> pokemons =
          body.map((dynamic item) => Pokemon.fromJson(item)).toList();*/
      
      return pokemon;
    } else {
      throw "Falha para buscar Pokemons.";
    }
  }

    Future<List<NamedApiResource>> findPokemonsList() async {
    final response =
        await http.get(Uri.parse("${AppConfig.pokeApiUrl}/pokemon"));

    if (response.statusCode == 200) {
      dynamic body = jsonDecode(response.body);
      PokemonPage page = PokemonPage.fromJson(body);

      return page.results;
    } else {
      throw "Falha para buscar Animais.";
    }
  }
}