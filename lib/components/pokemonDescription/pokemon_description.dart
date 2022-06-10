
import 'package:flutter/material.dart';

class PokemonDescription extends StatelessWidget {
  const PokemonDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Pokemon Description");
  }

  /*
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: snapshot.data!.types!
                    .map((type) => getTypeTags(type.type!.name))
                    .toList(),
              )
  */

  /*
    Widget getTypeTags(String type) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
      decoration: BoxDecoration(
        color: PokemonUtils.colorByType(type),
        border: const Border(
          top: BorderSide(width: 1.0, color: Color(0xAAFFFFFF)),
          right: BorderSide(width: 1.0, color: Color(0xAAFFFFFF)),
          bottom: BorderSide(width: 1.0, color: Color(0xAAFFFFFF)),
          left: BorderSide(width: 1.0, color: Color(0xAAFFFFFF)),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: Text(
        type.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
        ),
      ),
    );
  }
  */
}