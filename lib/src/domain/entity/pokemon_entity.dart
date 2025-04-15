import 'species_detail_entity.dart';
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
    this.speciesDetail,
  });

  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final bool isDefault;
  final int order;
  final int weight;
  final SpritesEntity sprites;
  final SpeciesDetailEntity? speciesDetail;

  PokemonEntity copyWith({
    int? id,
    String? name,
    int? baseExperience,
    int? height,
    bool? isDefault,
    int? order,
    int? weight,
    SpritesEntity? sprites,
    SpeciesDetailEntity? speciesDetail,
  }) {
    return PokemonEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      baseExperience: baseExperience ?? this.baseExperience,
      height: height ?? this.height,
      isDefault: isDefault ?? this.isDefault,
      order: order ?? this.order,
      weight: weight ?? this.weight,
      sprites: sprites ?? this.sprites,
      speciesDetail: speciesDetail ?? this.speciesDetail,
    );
  }
}
