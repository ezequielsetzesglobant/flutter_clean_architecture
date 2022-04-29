import '../../core/util/constants.dart';
import '../../domain/entity/habitat_entity.dart';

class HabitatModel extends HabitatEntity {
  HabitatModel({
    String name = Constants.defaultNome,
    String url = Constants.defaultUrl,
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
