import '../../domain/entity/pokemon_species_entity.dart';

class PokemonSpeciesModel extends PokemonSpeciesEntity {
  PokemonSpeciesModel({
    required String name,
    required String url,
  }) : super(
          name: name,
          url: url,
        );

  factory PokemonSpeciesModel.fromJson(Map<String, dynamic> json) {
    return PokemonSpeciesModel(
      name: json['name'],
      url: json['url'],
    );
  }
}
