import 'package:flutter/material.dart';
import '../../core/util/constants.dart';
import '../../core/util/text_styles.dart';
import '../../domain/entity/species_entity.dart';

class PokemonData extends StatelessWidget {
  const PokemonData({required this.species});

  final SpeciesEntity species;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(Constants.detailsPadding),
            child: Container(
              height: Constants.detailsNameHeight,
              width: Constants.detailsNameWeight,
              child: FittedBox(
                child: Text(
                  species.name.toUpperCase(),
                  style: TextStyles.detailsNameTextStyle,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Constants.detailsPadding),
            child: Text(
              '${Constants.detailsCaptureRateLabel}  ${species.captureRate}',
              style: TextStyles.detailsCaptureRateTextStyle,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Constants.detailsPadding),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.grey,
                    width: Constants.detailsBoxBorderWidth,
                  ),
                  borderRadius: BorderRadius.circular(
                    Constants.detailsBoxBorderRadius,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(Constants.detailsPadding),
                        child: Text(
                          '${Constants.detailsBabyLabel} ${species.isBaby}',
                          style: TextStyles.detailsAgeTextStyle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(Constants.detailsPadding),
                        child: Text(
                          '${Constants.detailsLegendaryLabel} ${species.isLegendary}',
                          style: TextStyles.detailsAgeTextStyle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(Constants.detailsPadding),
                        child: Text(
                          '${Constants.detailsMythicalLabel} ${species.isMythical}',
                          style: TextStyles.detailsAgeTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Constants.detailsPadding),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(
                    color: Colors.cyan,
                    width: Constants.detailsBoxBorderWidth,
                  ),
                  borderRadius: BorderRadius.circular(
                    Constants.detailsBoxBorderRadius,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(Constants.detailsPadding),
                        child: Text(
                          '${Constants.detailsColorLabel} ${species.color.name}',
                          style: TextStyles.detailsGeneralDataTextStyle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(Constants.detailsPadding),
                        child: Text(
                          '${Constants.detailsHabitatLabel} ${species.habitat.name}',
                          style: TextStyles.detailsGeneralDataTextStyle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(Constants.detailsPadding),
                        child: Text(
                          '${Constants.detailsShapeLabel} ${species.shape.name}',
                          style: TextStyles.detailsGeneralDataTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
