import '../../domain/entity/shape_entity.dart';

class ShapeModel extends ShapeEntity {
  ShapeModel({
    required String name,
    required String url,
  }) : super(
          name: name,
          url: url,
        );

  factory ShapeModel.fromJson(Map<String, dynamic> json) {
    return ShapeModel(
      name: json['name'],
      url: json['name'],
    );
  }
}
