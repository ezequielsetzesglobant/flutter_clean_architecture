import 'package:flutter/material.dart';
import '../../core/util/constants.dart';
import '../../data/datasource/remote/pokedex_api_service.dart';
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
                pokedexRepository: PokedexRepository(
                  pokedexApiService: PokedexApiService(),
                ),
              ),
            ),
          ),
        );
      case Constants.detailsPageRoute:
        return MaterialPageRoute(
          builder: (_) => DetailsPage(
            title: Constants.detailsPageTitle,
            bloc: SpeciesBloc(
              speciesUseCase: SpeciesUsecase(
                speciesRepository: SpeciesRepository(
                  pokedexApiService: PokedexApiService(),
                ),
              ),
            ),
            speciesId: settings.arguments as int,
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
