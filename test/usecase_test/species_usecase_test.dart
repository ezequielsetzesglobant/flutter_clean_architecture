import 'package:flutter_clean_architecture/src/core/resource/data_state.dart';
import 'package:flutter_clean_architecture/src/core/usecase/i_usecase.dart';
import 'package:flutter_clean_architecture/src/data/datasource/local/DAOs/pokemon_database.dart';
import 'package:flutter_clean_architecture/src/data/datasource/remote/pokedex_api_service.dart';
import 'package:flutter_clean_architecture/src/data/model/species_detail_model.dart';
import 'package:flutter_clean_architecture/src/data/repository/species_repository.dart';
import 'package:flutter_clean_architecture/src/domain/entity/species_detail_entity.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/implementation/species_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'pokedex_usecase_test.mocks.dart';

@GenerateMocks([
  PokedexApiService,
  PokemonDatabase,
])
void main() {
  late IUsecase usecase;
  late SpeciesRepository repository;
  late MockPokedexApiService pokedexApiService;
  late MockPokemonDatabase database;
  late DataState<SpeciesDetailEntity> dataStateSuccess;
  late DataState<SpeciesDetailEntity> dataStateFailed;
  late SpeciesDetailModel species;

  setUp(() {
    pokedexApiService = MockPokedexApiService();
    database = MockPokemonDatabase();
    repository = SpeciesRepository();
    repository.pokedexApiService = pokedexApiService;
    usecase = SpeciesUsecase(
      speciesRepository: repository,
      pokemonDatabase: database,
    );
    species = SpeciesDetailModel.fromJson(_getSpeciesJson());
    dataStateSuccess = DataSuccess(species);
    dataStateFailed = DataFailed('error');
  });

  group('Check species usecase', () {
    test('Case whit success', () async {
      when(pokedexApiService.getSpecies(speciesId: 1)).thenAnswer(
        (_) async => dataStateSuccess,
      );
      when(database.updatePokemon('1', species)).thenAnswer(
        (_) async => true,
      );
      when(database.getSpecies('1')).thenAnswer(
        (_) async => species,
      );

      DataState<SpeciesDetailEntity> dataStateResponse =
          await usecase(speciesId: 1);

      expect(dataStateResponse.data, dataStateSuccess.data);
      expect(dataStateResponse.error, null);
      expect(dataStateResponse.type, dataStateSuccess.type);
    });

    test('Case error when service fail', () async {
      when(pokedexApiService.getSpecies(speciesId: 1)).thenAnswer(
        (_) async => dataStateFailed,
      );
      when(database.getSpecies('1')).thenAnswer(
        (_) async => species,
      );

      DataState<SpeciesDetailEntity> dataStateResponse =
          await usecase(speciesId: 1);

      expect(dataStateResponse.data, dataStateSuccess.data);
      expect(dataStateResponse.error, null);
      expect(dataStateResponse.type, dataStateSuccess.type);
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
