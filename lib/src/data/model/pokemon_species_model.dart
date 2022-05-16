import '../../domain/entity/pokemon_species_entity.dart';

class PokemonSpeciesModel extends PokemonSpeciesEntity {
  PokemonSpeciesModel({
    required this.name,
    required this.url,
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

  final String name;
  final String url;
}
