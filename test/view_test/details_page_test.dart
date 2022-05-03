import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/resource/data_state.dart';
import 'package:flutter_clean_architecture/src/data/model/pokemon_model.dart';
import 'package:flutter_clean_architecture/src/data/model/species_model.dart';
import 'package:flutter_clean_architecture/src/domain/entity/pokemon_entity.dart';
import 'package:flutter_clean_architecture/src/domain/entity/species_entity.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/implementation/species_usecase.dart';
import 'package:flutter_clean_architecture/src/presentation/bloc/interface/i_species_bloc.dart';
import 'package:flutter_clean_architecture/src/presentation/bloc/species_bloc.dart';
import 'package:flutter_clean_architecture/src/presentation/view/details_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'details_page_test.mocks.dart';
import 'package:network_image_mock/network_image_mock.dart';

@GenerateMocks([
  SpeciesUsecase,
])
void main() {
  late ISpeciesBloc bloc;
  late MockSpeciesUsecase usecase;
  late DataState<SpeciesEntity> dataStateSuccess;
  late DataState<SpeciesEntity> dataStateFailed;
  late PokemonEntity pokemonEntity;

  setUp(() {
    usecase = MockSpeciesUsecase();
    bloc = SpeciesBloc(speciesUseCase: usecase);
    SpeciesModel speciesModel = SpeciesModel.fromJson(_getSpeciesJson());
    dataStateSuccess = DataSuccess(speciesModel);
    dataStateFailed = DataFailed('error');
    pokemonEntity = PokemonModel.fromJson(_getPokemonJson());
  });

  group('Check for existence and non-existence of widgets in DetailsPage', () {
    testWidgets('Case with success', (WidgetTester tester) async {
      when(usecase(speciesId: 1)).thenAnswer(
        (_) async => dataStateSuccess,
      );

      await tester.runAsync(() async {
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: DetailsPage(
                title: pokemonEntity.name.toUpperCase(),
                bloc: bloc,
                pokemonEntity: pokemonEntity,
              ),
            ),
          ),
        );
      });
      await tester.pump();

      expect(find.byType(Text), findsNWidgets(11));
      expect(find.text('error'), findsNothing);
    });

    testWidgets('Case error when service fail', (WidgetTester tester) async {
      when(usecase(speciesId: 1)).thenAnswer(
        (_) async => dataStateFailed,
      );

      await tester.runAsync(() async {
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: DetailsPage(
                title: pokemonEntity.name.toUpperCase(),
                bloc: bloc,
                pokemonEntity: pokemonEntity,
              ),
            ),
          ),
        );
      });
      await tester.pump();

      expect(find.text('error'), findsOneWidget);
      expect(find.byType(Text), findsNWidgets(2));
    });
  });
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

Map<String, dynamic> _getSpeciesJson() {
  return {
    "id": 1,
    "name": "bulbasaur",
    "capture_rate": 45,
    "is_baby": false,
    "is_legendary": false,
    "is_mythical": false,
    "color": {
      "name": "green",
      "url": "https://pokeapi.co/api/v2/pokemon-color/5/"
    },
    "habitat": {
      "name": "grassland",
      "url": "https://pokeapi.co/api/v2/pokemon-habitat/3/"
    },
    "shape": {
      "name": "quadruped",
      "url": "https://pokeapi.co/api/v2/pokemon-shape/8/"
    },
    "flavor_text_entries": [
      {
        "flavor_text":
            "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.",
      },
    ],
  };
}
