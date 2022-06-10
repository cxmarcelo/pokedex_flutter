class PokemonSprites {
  final String? back_female;
  final String? back_shiny_female;
  final String? back_default;
  final String? front_female;
  final String? front_shiny_female;
  final String? back_shiny;
  final String? front_default;
  final String? front_shiny;

  const PokemonSprites(
    this.back_female,
    this.back_shiny_female,
    this.back_default,
    this.front_female,
    this.front_shiny_female,
    this.back_shiny,
    this.front_default,
    this.front_shiny,
  );

  factory PokemonSprites.fromJson(Map<String, dynamic> json) {
    return PokemonSprites(
      json["back_female"],
      json["back_shiny_female"],
      json["back_default"],
      json["front_female"],
      json["front_shiny_female"],
      json["back_shiny"],
      json["front_default"],
      json["front_shiny"],
    );
  }
}
