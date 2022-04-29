import '../../core/util/constants.dart';
import '../../domain/entity/color_entity.dart';

class ColorModel extends ColorEntity {
  ColorModel({
    String name = Constants.defaultNome,
    String url = Constants.defaultUrl,
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
