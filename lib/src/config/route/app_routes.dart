import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/data/datasource/local/DAOs/pokemon_database.dart';
import '../../domain/entity/pokemon_entity.dart';
import '../../core/util/constants.dart';
import '../../data/repository/pokedex_repository.dart';
import '../../data/repository/species_repository.dart';
import '../../domain/usecase/implementation/pokedex_usecase.dart';
import '../../domain/usecase/implementation/species_usecase.dart';
import '../../presentation/bloc/pokedex_bloc.dart';
import '../../presentation/bloc/species_bloc.dart';
import '../../presentation/view/details_page.dart';
import '../../presentation/view/home_page.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constants.homePageRoute:
        return MaterialPageRoute(
          builder: (_) => HomePage(
            title: Constants.homePageTitle,
            bloc: PokedexBloc(
              pokedexUseCase: PokedexUsecase(
                pokedexRepository: PokedexRepository(),
                pokemonDatabase: PokemonDatabase(),
              ),
            ),
          ),
        );
      case Constants.detailsPageRoute:
        return MaterialPageRoute(
          builder: (_) => DetailsPage(
            title: (settings.arguments as PokemonEntity).name.toUpperCase(),
            bloc: SpeciesBloc(
              speciesUseCase: SpeciesUsecase(
                speciesRepository: SpeciesRepository(),
                pokemonDatabase: PokemonDatabase(),
              ),
            ),
            pokemonEntity: settings.arguments as PokemonEntity,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                Constants.defaultRouteMessage,
              ),
            ),
          ),
        );
    }
  }
}
