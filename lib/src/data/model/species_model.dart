import 'package:flutter_clean_architecture/src/core/util/constants.dart';

import '../../domain/entity/species_entity.dart';
import 'color_model.dart';
import 'flavor_text_entry_model.dart';
import 'habitat_model.dart';
import 'shape_model.dart';

class SpeciesModel extends SpeciesEntity {
  SpeciesModel({
    int id = Constants.defaultValue,
    String name = Constants.defaultNome,
    int captureRate = Constants.defaultValue,
    bool isBaby = false,
    bool isLegendary = false,
    bool isMythical = false,
    required ColorModel color,
    required HabitatModel habitat,
    required ShapeModel shape,
    List<FlavorTextEntryModel> flavorTextEntries = const [],
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
          flavorTextEntries: flavorTextEntries,
        );

  factory SpeciesModel.fromJson(Map<String, dynamic> json) {
    var jsonList = json['flavor_text_entries'] as List;
    List<FlavorTextEntryModel> flavorTextEntriesModel = jsonList
        .map((flavorTextEntryModel) =>
            FlavorTextEntryModel.fromJson(flavorTextEntryModel))
        .toList();
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
      flavorTextEntries: flavorTextEntriesModel,
    );
  }
}
