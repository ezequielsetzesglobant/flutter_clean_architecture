import '../../domain/entity/species_entity.dart';
import 'color_model.dart';
import 'habitat_model.dart';
import 'shape_model.dart';

class SpeciesModel extends SpeciesEntity {
  SpeciesModel({
    required int id,
    required String name,
    required int captureRate,
    required bool isBaby,
    required bool isLegendary,
    required bool isMythical,
    required ColorModel color,
    required HabitatModel habitat,
    required ShapeModel shape,
  }) : super(
          id: id,
          name: name,
          captureRate: captureRate,
          isBaby: isBaby,
          isLegendary: isLegendary,
          isMythical: isMythical,
          color: color,
          habitat: habitat,
          shape: shape,
        );

  factory SpeciesModel.fromJson(Map<String, dynamic> json) {
    return SpeciesModel(
      id: json['id'],
      name: json['name'],
      captureRate: json['capture_rate'],
      isBaby: json['is_baby'],
      isLegendary: json['is_legendary'],
      isMythical: json['is_mythical'],
      color: ColorModel.fromJson(json['color']),
      habitat: HabitatModel.fromJson(json['habitat']),
      shape: ShapeModel.fromJson(json['shape']),
    );
  }
}
