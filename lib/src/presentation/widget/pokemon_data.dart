import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../core/util/colors_constants.dart';
import '../../core/util/constants.dart';
import '../../core/util/text_styles.dart';
import '../../domain/entity/pokemon_entity.dart';

class PokemonData extends StatelessWidget {
  const PokemonData({required this.pokemonEntity});

  final PokemonEntity pokemonEntity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: SizedBox(
                height: Constants.detailsImageSize,
                child: ClipRRect(
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Image.asset(
                      Constants.imageNotFound,
                      width: Constants.detailsImageSize,
                      height: Constants.detailsImageSize,
                    ),
                    imageUrl: pokemonEntity.sprites.frontDefault,
                    errorWidget: (context, url, error) => Image.asset(
                      Constants.imageNotFound,
                      width: Constants.detailsImageSize,
                      height: Constants.detailsImageSize,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Constants.detailsPadding),
              child: Container(
                height: Constants.detailsNameHeight,
                width: Constants.detailsNameWeight,
                child: FittedBox(
                  child: Text(
                    pokemonEntity.name.toUpperCase(),
                    style: TextStyles.detailsNameTextStyle,
                  ),
                ),
              ),
            ),
            Padding(
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
            ),
            Padding(
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Constants.detailsBoxPadding),
                      child: Text(
                        '${Constants.detailsBabyLabel} ${pokemonEntity.species.isBaby ? Constants.yesValue : Constants.noValue}',
                        style: TextStyles.detailsAttributesTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Constants.detailsBoxPadding),
                      child: Text(
                        '${Constants.detailsLegendaryLabel} ${pokemonEntity.species.isLegendary ? Constants.yesValue : Constants.noValue}',
                        style: TextStyles.detailsAttributesTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Constants.detailsBoxPadding),
                      child: Text(
                        '${Constants.detailsMythicalLabel} ${pokemonEntity.species.isMythical ? Constants.yesValue : Constants.noValue}',
                        style: TextStyles.detailsAttributesTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Constants.detailsBoxPadding),
                      child: Text(
                        '${Constants.detailsHabitatLabel} ${pokemonEntity.species.habitat.name}',
                        style: TextStyles.detailsAttributesTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Constants.detailsBoxPadding),
                      child: Text(
                        '${Constants.detailsShapeLabel} ${pokemonEntity.species.shape.name}',
                        style: TextStyles.detailsAttributesTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Constants.detailsPadding),
              child: Text(
                Constants.descriptionTitle,
                style: TextStyles.detailsDescriptionTitleTextStyle,
              ),
            ),
            Text(
              '${pokemonEntity.species.flavorTextEntries.first.flavorText}',
              style: TextStyles.detailsDescriptionTextStyle,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
