import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/config/route/app_routes.dart';
import 'src/config/theme/app_themes.dart';
import 'src/core/util/constants.dart';
import 'src/data/datasource/remote/pokedex_api_service.dart';
import 'src/data/repository/pokedex_repository.dart';
import 'src/domain/usecase/implementation/pokedex_usecase.dart';
import 'src/presentation/bloc/pokedex_bloc.dart';
import 'src/presentation/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appTitle,
      theme: Themes.appTheme,
      home: HomePage(
        title: Constants.homePageTitle,
        bloc: PokedexBloc(
          pokedexUseCase: PokedexUsecase(
            pokedexRepository: PokedexRepository(
              pokedexApiService: PokedexApiService(),
            ),
          ),
        ),
      ),
      initialRoute: Constants.homePageRoute,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
