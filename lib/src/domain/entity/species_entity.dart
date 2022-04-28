import 'color_entity.dart';
import 'habitat_entity.dart';
import 'shape_entity.dart';

class SpeciesEntity {
  SpeciesEntity({
    required this.id,
    required this.name,
    required this.captureRate,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.color,
    required this.habitat,
    required this.shape,
  });

  int id;
  String name;
  int captureRate;
  bool isBaby;
  bool isLegendary;
  bool isMythical;
  ColorEntity color;
  HabitatEntity habitat;
  ShapeEntity shape;
}
