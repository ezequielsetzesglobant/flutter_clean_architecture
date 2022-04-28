import 'package:flutter/material.dart';
import 'list_item.dart';
import '../../core/util/constants.dart';
import '../../core/util/text_styles.dart';
import '../bloc/state/pokedex_state.dart';

class PokemonsList extends StatelessWidget {
  const PokemonsList({required this.data});

  final PokedexState data;

  @override
  Widget build(BuildContext context) {
    switch (data.type) {
      case PokedexStateType.success:
        return ListView.builder(
          itemCount: data.pokedexEntity?.pokemonEntries.length,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return ListItem(
              pokemon: data.pokedexEntity!.pokemonEntries[index].pokemon,
            );
          },
        );
      case PokedexStateType.empty:
        return Center(
          child: Text(
            Constants.emptyListMessage,
            style: TextStyles.pokedexTextStyle,
          ),
        );
      case PokedexStateType.error:
        return Center(
          child: Text(
            data.error!,
            style: TextStyles.pokedexTextStyle,
          ),
        );
      case PokedexStateType.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
  }
}
