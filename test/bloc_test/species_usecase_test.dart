import 'package:flutter_clean_architecture/src/core/resource/data_state.dart';
import 'package:flutter_clean_architecture/src/core/usecase/i_usecase.dart';
import 'package:flutter_clean_architecture/src/data/datasource/remote/pokedex_api_service.dart';
import 'package:flutter_clean_architecture/src/data/model/species_model.dart';
import 'package:flutter_clean_architecture/src/data/repository/species_repository.dart';
import 'package:flutter_clean_architecture/src/domain/entity/species_entity.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/implementation/species_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'pokedex_usecase_test.mocks.dart';

@GenerateMocks([
  PokedexApiService,
])
void main() {
  late IUsecase usecase;
  late MockPokedexApiService pokedexApiService;
  late DataState<SpeciesEntity> dataStateSuccess;
  late DataState<SpeciesEntity> dataStateFailed;

  setUp(() {
    pokedexApiService = MockPokedexApiService();
    usecase = SpeciesUsecase(
      speciesRepository: SpeciesRepository(
        pokedexApiService: pokedexApiService,
      ),
    );
    SpeciesModel speciesModel = SpeciesModel.fromJson(_getSpeciesJson());
    dataStateSuccess = DataSuccess(speciesModel);
    dataStateFailed = DataFailed('error');
  });

  group('Check species usecase', () {
    test('Case whit success', () async {
      when(pokedexApiService.getSpecies(speciesId: 1)).thenAnswer(
        (_) async => dataStateSuccess,
      );

      DataState<SpeciesEntity> dataStateResponse = await usecase(speciesId: 1);

      expect(dataStateResponse.data, dataStateSuccess.data);
      expect(dataStateResponse.error, null);
      expect(dataStateResponse.type, dataStateSuccess.type);
    });

    test('Case error when service fail', () async {
      when(pokedexApiService.getSpecies(speciesId: 1)).thenAnswer(
        (_) async => dataStateFailed,
      );

      DataState<SpeciesEntity> dataStateResponse = await usecase(speciesId: 1);

      expect(dataStateResponse.error, dataStateFailed.error);
      expect(dataStateResponse.data, null);
      expect(dataStateResponse.type, dataStateFailed.type);
    });
  });
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
