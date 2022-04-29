import 'species_entity.dart';
import 'sprites_entity.dart';

class PokemonEntity {
  PokemonEntity({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.order,
    required this.weight,
    required this.sprites,
    required this.species,
  });

  int id;
  String name;
  int baseExperience;
  int height;
  bool isDefault;
  int order;
  int weight;
  SpritesEntity sprites;
  SpeciesEntity species;
}
