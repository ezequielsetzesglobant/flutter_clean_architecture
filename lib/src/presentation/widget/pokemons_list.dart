import 'package:flutter/material.dart';
import 'home_scaffold.dart';
import '../view/splash_screen.dart';
import 'list_item.dart';
import '../../core/util/constants.dart';
import '../../core/util/text_styles.dart';
import '../bloc/state/pokedex_state.dart';

class PokemonsList extends StatelessWidget {
  const PokemonsList({
    required this.title,
    required this.data,
  });

  final String title;
  final PokedexState data;

  @override
  Widget build(BuildContext context) {
    switch (data.type) {
      case PokedexStateType.success:
        return HomeScaffold(
          title: title,
          child: ListView.builder(
            itemCount: data.pokedexEntity?.pokemonEntries.length,
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              return ListItem(
                pokemonEntity:
                    data.pokedexEntity!.pokemonEntries[index].pokemon!,
              );
            },
          ),
        );
      case PokedexStateType.empty:
        return HomeScaffold(
          title: title,
          child: Center(
            child: const Text(
              Constants.emptyListMessage,
              style: TextStyles.noSuccessMessageTextStyle,
            ),
          ),
        );
      case PokedexStateType.error:
        return HomeScaffold(
          title: title,
          child: Center(
            child: Text(
              data.error!,
              style: TextStyles.noSuccessMessageTextStyle,
            ),
          ),
        );
      case PokedexStateType.splash:
        return const SplashScreen();
    }
  }
}
