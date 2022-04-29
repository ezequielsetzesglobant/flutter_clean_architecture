import '../../core/util/constants.dart';
import '../../domain/entity/shape_entity.dart';

class ShapeModel extends ShapeEntity {
  ShapeModel({
    String name = Constants.defaultNome,
    String url = Constants.defaultUrl,
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
