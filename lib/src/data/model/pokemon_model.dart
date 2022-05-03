import 'species_model.dart';
import 'sprites_model.dart';
import '../../domain/entity/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel({
    required int id,
    required String name,
    required int baseExperience,
    required int height,
    required bool isDefault,
    required int order,
    required int weight,
    required SpritesModel sprites,
    SpeciesModel? species,
  }) : super(
          id: id,
          name: name,
          baseExperience: baseExperience,
          height: height,
          isDefault: isDefault,
          order: order,
          weight: weight,
          sprites: sprites,
          species: species,
        );

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      baseExperience: json['base_experience'],
      height: json['height'],
      isDefault: json['is_default'],
      order: json['order'],
      weight: json['weight'],
      sprites: SpritesModel.fromJson(json['sprites']),
    );
  }
}
