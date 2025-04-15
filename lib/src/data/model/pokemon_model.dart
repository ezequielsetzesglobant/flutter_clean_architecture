import '../../domain/entity/species_detail_entity.dart';
import '../../domain/entity/sprites_entity.dart';
import 'species_detail_model.dart';
import 'sprites_model.dart';
import '../../domain/entity/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.order,
    required this.weight,
    required this.sprites,
    this.speciesDetail,
  }) : super(
          id: id,
          name: name,
          baseExperience: baseExperience,
          height: height,
          isDefault: isDefault,
          order: order,
          weight: weight,
          sprites: sprites,
          speciesDetail: speciesDetail,
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
      speciesDetail: json['species_detail'] != null
          ? SpeciesDetailModel.fromJson(json['species_detail'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'base_experience': baseExperience,
      'height': height,
      'is_default': isDefault,
      'order': order,
      'weight': weight,
      'sprites': sprites.toJson(),
      'species_detail': speciesDetail?.toJson(),
    };
  }

  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final bool isDefault;
  final int order;
  final int weight;
  final SpritesModel sprites;
  final SpeciesDetailModel? speciesDetail;

  @override
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
    return PokemonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      baseExperience: baseExperience ?? this.baseExperience,
      height: height ?? this.height,
      isDefault: isDefault ?? this.isDefault,
      order: order ?? this.order,
      weight: weight ?? this.weight,
      sprites: sprites != null ? sprites as SpritesModel : this.sprites,
      speciesDetail: speciesDetail != null
          ? speciesDetail as SpeciesDetailModel
          : this.speciesDetail,
    );
  }
}
