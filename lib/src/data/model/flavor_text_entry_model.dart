import '../../domain/entity/flavor_text_entry_entity.dart';

class FlavorTextEntryModel extends FlavorTextEntryEntity {
  FlavorTextEntryModel({
    required this.flavorText,
  }) : super(
          flavorText: flavorText,
        );

  factory FlavorTextEntryModel.fromJson(Map<String, dynamic> json) {
    return FlavorTextEntryModel(
      flavorText: json['flavor_text'],
    );
  }

  final String flavorText;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'flavor_text': flavorText,
    };
  }
}
