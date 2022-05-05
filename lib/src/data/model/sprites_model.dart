import '../../core/util/constants.dart';
import '../../domain/entity/sprites_entity.dart';

class SpritesModel extends SpritesEntity {
  SpritesModel({
    required String frontDefault,
    required String backDefault,
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
}
