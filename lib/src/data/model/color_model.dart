import '../../domain/entity/color_entity.dart';

class ColorModel extends ColorEntity {
  ColorModel({
    required this.name,
    required this.url,
  }) : super(
          name: name,
          url: url,
        );

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
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
