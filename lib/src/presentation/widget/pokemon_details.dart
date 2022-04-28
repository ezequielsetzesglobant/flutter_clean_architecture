import 'package:flutter/material.dart';
import '../../core/util/text_styles.dart';
import '../bloc/state/species_state.dart';
import 'pokemon_data.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({required this.data});

  final SpeciesState data;

  @override
  Widget build(BuildContext context) {
    switch (data.type) {
      case SpeciesStateType.success:
        return PokemonData(
          species: data.speciesEntity!,
        );
      case SpeciesStateType.error:
        return Center(
          child: Text(
            data.error!,
            style: TextStyles.pokedexTextStyle,
          ),
        );
      case SpeciesStateType.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      default:
        return Container();
    }
  }
}
