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
    if (widget.data is PokedexSuccess) {
      return ListView.builder(
        itemCount: widget.data.pokedex_entity?.pokemonEntries.length,
        itemBuilder: (context, index) {
          return ListItem(
            pokemon: widget.data.pokedex_entity!.pokemonEntries[index].pokemon,
          );
        },
      );
    } else if (widget.data is PokedexEmpty) {
      return Center(
        child: Text(
          Constants.emptyListMessage,
          style: TextStyles.pokedexTextStyle,
        ),
      );
    } else if (widget.data is PokedexError) {
      return Center(
        child: Text(
          widget.data.error!,
          style: TextStyles.pokedexTextStyle,
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
