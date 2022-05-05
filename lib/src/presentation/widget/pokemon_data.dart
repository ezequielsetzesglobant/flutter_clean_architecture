import 'package:flutter/material.dart';
import 'pokemon_bodily_information.dart';
import 'pokemon_information_box.dart';
import 'pokemon_image.dart';
import '../../core/util/constants.dart';
import '../../core/util/text_styles.dart';
import '../../domain/entity/pokemon_entity.dart';

class PokemonData extends StatelessWidget {
  const PokemonData({
    required this.pokemonEntity,
  });

  final PokemonEntity pokemonEntity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PokemonImage(
              url: pokemonEntity.sprites.frontDefault,
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
            PokemonBodilyInformation(
              pokemonEntity: pokemonEntity,
            ),
            PokemonInformationBox(
              pokemonEntity: pokemonEntity,
            ),
            Padding(
              padding: const EdgeInsets.all(Constants.detailsPadding),
              child: Text(
                Constants.descriptionTitle,
                style: TextStyles.detailsDescriptionTitleTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: Constants.detailsPadding),
              child: Text(
                '${pokemonEntity.species?.flavorTextEntries.first.flavorText}',
                style: TextStyles.detailsDescriptionTextStyle,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
