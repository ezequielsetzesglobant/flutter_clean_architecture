import 'color_entity.dart';
import 'flavor_text_entry_entity.dart';
import 'habitat_entity.dart';
import 'shape_entity.dart';

class SpeciesDetailEntity {
  SpeciesDetailEntity({
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
  });

  final int id;
  final String name;
  final int captureRate;
  final bool isBaby;
  final bool isLegendary;
  final bool isMythical;
  final ColorEntity color;
  final HabitatEntity habitat;
  final ShapeEntity shape;
  final List<FlavorTextEntryEntity> flavorTextEntries;
}
