import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../core/util/constants.dart';
import '../../core/util/text_styles.dart';
import '../../domain/entity/pokemon_entity.dart';

class ListItem extends StatelessWidget {
  const ListItem({required this.pokemon});

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: Colors.lightBlue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: Constants.itemListHeight,
                child: Padding(
                  padding: const EdgeInsets.all(Constants.cardElementsPadding),
                  child: ClipRRect(
                    child: CachedNetworkImage(
                      placeholder: (context, url) => Image.asset(
                        Constants.imageNotFound,
                        width: Constants.imageSize,
                        height: Constants.imageSize,
                      ),
                      imageUrl: pokemon.sprites.frontDefault,
                      errorWidget: (context, url, error) => Image.asset(
                        Constants.imageNotFound,
                        width: Constants.imageSize,
                        height: Constants.imageSize,
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
                    height: Constants.nameHeight,
                    width: Constants.nameWeight,
                    child: FittedBox(
                      child: Text(
                        pokemon.name.toUpperCase(),
                        style: TextStyles.nameTextStyle,
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
                        '${Constants.weightLabel} ${pokemon.weight}',
                        style: TextStyles.weightTextStyle,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.all(Constants.cardElementsPadding),
                      child: Text(
                        '${Constants.heightLabel} ${pokemon.height}',
                        style: TextStyles.heightTextStyle,
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
          arguments: pokemon.id,
        );
      },
    );
  }
}
