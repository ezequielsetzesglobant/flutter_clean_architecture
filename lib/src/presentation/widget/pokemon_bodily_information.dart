import 'package:flutter/material.dart';
import '../../core/util/colors_constants.dart';
import '../../core/util/constants.dart';
import '../../core/util/text_styles.dart';
import '../../domain/entity/pokemon_entity.dart';

class PokemonBodilyInformation extends StatelessWidget {
  const PokemonBodilyInformation({
    required this.pokemonEntity,
  });

  final PokemonEntity pokemonEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Constants.detailsPadding),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorsConstants.detailsCaptureRateBorderColor,
            width: Constants.detailsBoxBorderWidth,
          ),
          borderRadius: BorderRadius.circular(
            Constants.detailsBoxBorderRadius,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(Constants.detailsPadding),
              child: Text(
                '${Constants.detailsWeightLabel} ${pokemonEntity.weight}',
                style: TextStyles.detailsWeightAndHeightTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Constants.detailsPadding),
              child: Text(
                '${Constants.detailsHeightLabel} ${pokemonEntity.height}',
                style: TextStyles.detailsWeightAndHeightTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
