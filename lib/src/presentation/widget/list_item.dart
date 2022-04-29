import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../core/util/colors_constants.dart';
import '../../core/util/constants.dart';
import '../../core/util/text_styles.dart';
import '../../domain/entity/pokemon_entity.dart';

class ListItem extends StatelessWidget {
  const ListItem({required this.pokemonEntity});

  final PokemonEntity pokemonEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: ColorsConstants.cardColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: Constants.cardImageSize,
                child: Padding(
                  padding: const EdgeInsets.all(Constants.cardElementsPadding),
                  child: ClipRRect(
                    child: CachedNetworkImage(
                      placeholder: (context, url) => Image.asset(
                        Constants.imageNotFound,
                        width: Constants.cardImageSize,
                        height: Constants.cardImageSize,
                      ),
                      imageUrl: pokemonEntity.sprites.frontDefault,
                      errorWidget: (context, url, error) => Image.asset(
                        Constants.imageNotFound,
                        width: Constants.cardImageSize,
                        height: Constants.cardImageSize,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(Constants.cardElementsPadding),
                  child: Container(
                    height: Constants.cardNameHeight,
                    width: Constants.cardNameWeight,
                    child: FittedBox(
                      child: Text(
                        pokemonEntity.name.toUpperCase(),
                        style: TextStyles.cardNameTextStyle,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.all(Constants.cardElementsPadding),
                      child: Text(
                        '${Constants.cardWeightLabel} ${pokemonEntity.weight}',
                        style: TextStyles.cardAttributesTextStyle,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.all(Constants.cardElementsPadding),
                      child: Text(
                        '${Constants.cardHeightLabel} ${pokemonEntity.height}',
                        style: TextStyles.cardAttributesTextStyle,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          Constants.detailsPageRoute,
          arguments: pokemonEntity,
        );
      },
    );
  }
}
