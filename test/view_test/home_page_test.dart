import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/resource/data_state.dart';
import 'package:flutter_clean_architecture/src/data/model/pokedex_model.dart';
import 'package:flutter_clean_architecture/src/data/model/pokemon_model.dart';
import 'package:flutter_clean_architecture/src/domain/entity/pokedex_entity.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/implementation/pokedex_usecase.dart';
import 'package:flutter_clean_architecture/src/presentation/bloc/interface/i_pokedex_bloc.dart';
import 'package:flutter_clean_architecture/src/presentation/bloc/pokedex_bloc.dart';
import 'package:flutter_clean_architecture/src/presentation/view/home_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'home_page_test.mocks.dart';
import 'package:network_image_mock/network_image_mock.dart';

@GenerateMocks([
  PokedexUsecase,
])
void main() {
  late IPokedexBloc bloc;
  late MockPokedexUsecase usecase;
  late DataState<PokedexEntity> dataStateSuccess;
  late DataState<PokedexEntity> dataStateFailed;
  late DataState<PokedexEntity> dataStateEmptyList;

  setUp(() {
    usecase = MockPokedexUsecase();
    bloc = PokedexBloc(pokedexUseCase: usecase);
    PokedexModel pokedexModel = PokedexModel.fromJson(_getPokedexJson());
    pokedexModel.pokemonEntries.first.pokemon =
        PokemonModel.fromJson(_getPokemonJson());
    dataStateSuccess = DataSuccess(pokedexModel);
    dataStateFailed = DataFailed('error');
    PokedexModel pokedexModelEmptyList =
        PokedexModel.fromJson(_getPokedexJson());
    pokedexModelEmptyList.pokemonEntries.clear();
    dataStateEmptyList = DataSuccess(pokedexModelEmptyList);
  });

  group('Check for existence and non-existence of widgets', () {
    testWidgets('Case with success', (WidgetTester tester) async {
      when(usecase()).thenAnswer(
        (_) async => dataStateSuccess,
      );

      await tester.runAsync(() async {
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: HomePage(
                title: 'Home Page',
                bloc: bloc,
              ),
            ),
          ),
        );
      });
      await tester.pump();

      expect(find.byType(Card), findsOneWidget);
      expect(find.text('error'), findsNothing);
      expect(find.text('Pokemons not found'), findsNothing);
    });

    testWidgets('Case with error', (WidgetTester tester) async {
      when(usecase()).thenAnswer(
        (_) async => dataStateFailed,
      );

      await tester.runAsync(() async {
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: HomePage(
                title: 'Home Page',
                bloc: bloc,
              ),
            ),
          ),
        );
      });
      await tester.pump();

      expect(find.text('error'), findsOneWidget);
      expect(find.byType(Card), findsNothing);
      expect(find.text('Pokemons not found'), findsNothing);
    });

    testWidgets('Case with empty list', (WidgetTester tester) async {
      when(usecase()).thenAnswer(
        (_) async => dataStateEmptyList,
      );

      await tester.runAsync(() async {
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: HomePage(
                title: 'Home Page',
                bloc: bloc,
              ),
            ),
          ),
        );
      });
      await tester.pump();

      expect(find.text('Pokemons not found'), findsOneWidget);
      expect(find.byType(Card), findsNothing);
      expect(find.text('error'), findsNothing);
    });
  });
}

Map<String, dynamic> _getPokedexJson() {
  return {
    "id": 1,
    "is_main_series": true,
    "name": "national",
    "pokemon_entries": [
      {
        "entry_number": 1,
        "pokemon_species": {"name": "bulbasaur", "url": ""}
      },
    ],
  };
}

Map<String, dynamic> _getPokemonJson() {
  return {
    "base_experience": 64,
    "height": 7,
    "id": 1,
    "is_default": true,
    "name": "bulbasaur",
    "order": 1,
    "weight": 69,
    "sprites": {"back_default": "", "front_default": ""}
  };
}
