import '../../domain/entity/species_detail_entity.dart';
import 'color_model.dart';
import 'flavor_text_entry_model.dart';
import 'habitat_model.dart';
import 'shape_model.dart';

class SpeciesDetailModel extends SpeciesDetailEntity {
  SpeciesDetailModel({
    required this.id,
    required this.name,
    required this.captureRate,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.color,
    required this.habitat,
    required this.shape,
    required this.flavorTextEntries,
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

  factory SpeciesDetailModel.fromJson(Map<String, dynamic> json) {
    var jsonList = json['flavor_text_entries'] as List;
    List<FlavorTextEntryModel> flavorTextEntriesModel = jsonList
        .map((flavorTextEntryModel) =>
            FlavorTextEntryModel.fromJson(flavorTextEntryModel))
        .toList();
    return SpeciesDetailModel(
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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'capture_rate': captureRate,
      'is_baby': isBaby,
      'is_legendary': isLegendary,
      'is_mythical': isMythical,
      'color': color.toJson(),
      'habitat': habitat.toJson(),
      'shape': shape.toJson(),
      'flavor_text_entries': flavorTextEntries
          .map((flavorTextEntryModel) => flavorTextEntryModel.toJson())
          .toList(),
    };
  }

  final int id;
  final String name;
  final int captureRate;
  final bool isBaby;
  final bool isLegendary;
  final bool isMythical;
  final ColorModel color;
  final HabitatModel habitat;
  final ShapeModel shape;
  final List<FlavorTextEntryModel> flavorTextEntries;
}
