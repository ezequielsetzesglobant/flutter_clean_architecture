import 'package:flutter/material.dart';
import 'list_item.dart';
import '../../core/util/constants.dart';
import '../../core/util/text_styles.dart';
import '../bloc/state/pokedex_state.dart';

class PokemonsList extends StatefulWidget {
  const PokemonsList({required this.data});

  final PokedexState data;

  @override
  State<PokemonsList> createState() => _PokemonsListState();
}

class _PokemonsListState extends State<PokemonsList> {
  @override
  Widget build(BuildContext context) {
    switch (widget.data.type) {
      case PokedexStateType.success:
        return ListView.builder(
          itemCount: widget.data.pokedexEntity?.pokemonEntries.length,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return ListItem(
              pokemon: widget.data.pokedexEntity!.pokemonEntries[index].pokemon,
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
            widget.data.error!,
            style: TextStyles.pokedexTextStyle,
          ),
        );
      default:
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
  }
}
