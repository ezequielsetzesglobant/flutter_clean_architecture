import '../../domain/entity/habitat_entity.dart';

class HabitatModel extends HabitatEntity {
  HabitatModel({
    required this.name,
    required this.url,
  }) : super(
          name: name,
          url: url,
        );

  factory HabitatModel.fromJson(Map<String, dynamic> json) {
    return HabitatModel(
      name: json['name'],
      url: json['url'],
    );
  }

  final String name;
  final String url;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }
}
