import 'habitat_model.dart';
import 'shape_model.dart';
import 'species_model.dart';
import '../../core/util/constants.dart';
import 'color_model.dart';
import 'sprites_model.dart';
import '../../domain/entity/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel({
    int id = Constants.defaultValue,
    String name = Constants.defaultNome,
    int baseExperience = Constants.defaultValue,
    int height = Constants.defaultValue,
    bool isDefault = false,
    int order = Constants.defaultValue,
    int weight = Constants.defaultValue,
    required SpritesModel sprites,
    required SpeciesModel species,
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
      species: SpeciesModel(
        color: ColorModel(),
        habitat: HabitatModel(),
        shape: ShapeModel(),
      ),
    );
  }
}
