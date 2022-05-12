import '../../domain/entity/shape_entity.dart';

class ShapeModel extends ShapeEntity {
  ShapeModel({
    required this.name,
    required this.url,
  }) : super(
          name: name,
          url: url,
        );

  factory ShapeModel.fromJson(Map<String, dynamic> json) {
    return ShapeModel(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  final String name;
  final String url;
}
