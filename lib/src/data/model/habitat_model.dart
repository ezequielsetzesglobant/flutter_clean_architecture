import '../../domain/entity/habitat_entity.dart';

class HabitatModel extends HabitatEntity {
  HabitatModel({
    required String name,
    required String url,
  }) : super(
          name: name,
          url: url,
        );

  factory HabitatModel.fromJson(Map<String, dynamic> json) {
    return HabitatModel(
      name: json['name'],
      url: json['name'],
    );
  }
}
