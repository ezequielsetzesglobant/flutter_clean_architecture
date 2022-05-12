import '../../core/util/constants.dart';
import '../../domain/entity/sprites_entity.dart';

class SpritesModel extends SpritesEntity {
  SpritesModel({
    required this.frontDefault,
    required this.backDefault,
  }) : super(
          frontDefault: frontDefault,
          backDefault: backDefault,
        );

  factory SpritesModel.fromJson(Map<String, dynamic> json) {
    return SpritesModel(
      frontDefault: json['front_default'],
      backDefault: json['back_default'] ?? Constants.imageNotFound,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'front_default': frontDefault,
      'back_default': backDefault,
    };
  }

  final String frontDefault;
  final String backDefault;
}
