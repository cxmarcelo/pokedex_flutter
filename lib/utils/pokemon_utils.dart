import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/enum/types_enum.dart';
import 'package:pokedex_flutter/models/pokemon/pokemon.dart';
import 'package:pokedex_flutter/models/pokemon/pokemon_type.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

class PokemonUtils {
  static String formatPokeId(String id) {
    if (id.length < 2) {
      return "#00$id";
    } else if (id.length < 3) {
      return "#0$id";
    } else {
      return "#$id";
    }
  }

  static List<Color> getColors(Pokemon pokemon) {
    List<Color> colors = [];
    if (pokemon.types != null) {
      for (PokemonType type in pokemon.types!) {
        colors.add(PokemonUtils.colorByType(type.type!.name));
      }
    }

    if (colors.isEmpty) {
      colors.add(Colors.white);
      colors.add(Colors.grey);
    } else if (colors.length == 1) {
      colors.add(colors[0].withOpacity(0.8));
    }

    return colors;
  }

  static Color colorByType(String type) {
    Color color = Colors.white;

    if (type == TypesEnum.grass.name) {
      color = const Color(0xFF78C850);
    } else if (type == TypesEnum.fire.name) {
      color = const Color(0xFFF08030);
    } else if (type == TypesEnum.water.name) {
      color = const Color(0xFF6890F0);
    } else if (type == TypesEnum.poison.name) {
      color = const Color(0xFFA040A0);
    } else if (type == TypesEnum.bug.name) {
      color = const Color(0xFFA8B820);
    } else if (type == TypesEnum.normal.name) {
      color = const Color(0xFFA8A878);
    } else if (type == TypesEnum.flying.name) {
      color = const Color(0xFFA890F0);
    } else if (type == TypesEnum.dark.name) {
      color = const Color(0xFF705848);
    } else if (type == TypesEnum.electric.name) {
      color = const Color(0xFFF8D030);
    } else if (type == TypesEnum.psychic.name) {
      color = const Color(0xFFF85888);
    } else if (type == TypesEnum.ground.name) {
      color = const Color(0xFFE0C068);
    } else if (type == TypesEnum.steel.name) {
      color = const Color(0xFFB8B8D0);
    } else if (type == TypesEnum.ice.name) {
      color = const Color(0xFF98D8D8);
    } else if (type == TypesEnum.rock.name) {
      color = const Color(0xFFB8A038);
    } else if (type == TypesEnum.fighting.name) {
      color = const Color(0xFFC03028);
    } else if (type == TypesEnum.fairy.name) {
      color = const Color(0xFFEE99AC);
    } else if (type == TypesEnum.ghost.name) {
      color = const Color(0xFF705898);
    } else if (type == TypesEnum.dragon.name) {
      color = const Color(0xFF7038F8);
    }

    return color;
  }
}
