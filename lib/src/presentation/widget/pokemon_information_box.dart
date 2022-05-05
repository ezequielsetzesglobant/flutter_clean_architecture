import 'package:flutter/material.dart';
import '../../domain/entity/pokemon_entity.dart';
import '../../core/util/colors_constants.dart';
import '../../core/util/constants.dart';
import 'detail_box_text.dart';

class PokemonInformationBox extends StatelessWidget {
  const PokemonInformationBox({
    required this.pokemonEntity,
  });

  final PokemonEntity pokemonEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Constants.detailsPadding),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsConstants.detailsAttributesBoxColor,
          border: Border.all(
            color: Colors.black,
            width: Constants.detailsBoxBorderWidth,
          ),
          borderRadius: BorderRadius.circular(
            Constants.detailsBoxBorderRadius,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DetailBoxText(
              text:
                  '${Constants.detailsBabyLabel} ${pokemonEntity.species!.isBaby ? Constants.yesValue : Constants.noValue}',
            ),
            DetailBoxText(
              text:
                  '${Constants.detailsLegendaryLabel} ${pokemonEntity.species!.isLegendary ? Constants.yesValue : Constants.noValue}',
            ),
            DetailBoxText(
              text:
                  '${Constants.detailsMythicalLabel} ${pokemonEntity.species!.isMythical ? Constants.yesValue : Constants.noValue}',
            ),
            DetailBoxText(
              text:
                  '${Constants.detailsHabitatLabel} ${pokemonEntity.species?.habitat.name}',
            ),
            DetailBoxText(
              text:
                  '${Constants.detailsShapeLabel} ${pokemonEntity.species?.shape.name}',
            ),
          ],
        ),
      ),
    );
  }
}
