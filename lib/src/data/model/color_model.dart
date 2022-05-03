import '../../domain/entity/color_entity.dart';

class ColorModel extends ColorEntity {
  ColorModel({
    required String name,
    required String url,
  }) : super(
          name: name,
          url: url,
        );

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
      name: json['name'],
      url: json['name'],
    );
  }
}
