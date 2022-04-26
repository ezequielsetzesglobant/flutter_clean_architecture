import 'package:flutter_clean_architecture/src/core/resource/data_state.dart';
import 'package:flutter_clean_architecture/src/core/usecase/i_usecase.dart';
import 'package:flutter_clean_architecture/src/data/datasource/remote/pokedex_api_service.dart';
import 'package:flutter_clean_architecture/src/data/model/pokedex_model.dart';
import 'package:flutter_clean_architecture/src/data/model/pokemon_model.dart';
import 'package:flutter_clean_architecture/src/data/repository/pokedex_repository.dart';
import 'package:flutter_clean_architecture/src/domain/entity/pokedex_entity.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/implementation/pokedex_usecase.dart';
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
  late DataState<PokedexEntity> dataStateSuccess;
  late DataState<PokedexEntity> dataStateFailed;
  late DataState<PokedexEntity> dataStateEmptyList;

  setUp(() {
    pokedexApiService = MockPokedexApiService();
    usecase = PokedexUsecase(
      pokedexRepository: PokedexRepository(
        pokedexApiService: pokedexApiService,
      ),
    );
    PokedexModel pokedexModel = PokedexModel.fromJson(_getPokedexJson());
    pokedexModel.pokemonEntries.first.pokemon =
        PokemonModel.fromJson(_getPokemonJson());
    dataStateSuccess = DataSuccess(pokedexModel);
    dataStateFailed = DataFailed('error');
    dataStateEmptyList = DataEmpty();
  });

  group('Check pokedex usecase', () {
    test('Case whit success', () async {
      when(pokedexApiService.getPokemonIds()).thenAnswer(
        (_) async => dataStateSuccess,
      );

      DataState<PokedexEntity> dataStateResponse = await usecase();

      expect(dataStateResponse.data, dataStateSuccess.data);
      expect(dataStateResponse.error, null);
      expect(dataStateResponse.type, dataStateSuccess.type);
    });

    test('Case whit failed', () async {
      when(pokedexApiService.getPokemonIds()).thenAnswer(
        (_) async => dataStateFailed,
      );

      DataState<PokedexEntity> dataStateResponse = await usecase();

      expect(dataStateResponse.error, dataStateFailed.error);
      expect(dataStateResponse.data, null);
      expect(dataStateResponse.type, dataStateFailed.type);
    });

    test('Case whit empty list', () async {
      when(pokedexApiService.getPokemonIds()).thenAnswer(
        (_) async => dataStateEmptyList,
      );

      DataState<PokedexEntity> dataStateResponse = await usecase();

      expect(dataStateResponse.data, null);
      expect(dataStateResponse.error, null);
      expect(dataStateResponse.type, dataStateEmptyList.type);
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
        "pokemon_species": {
          "name": "bulbasaur",
          "url": "https://pokeapi.co/api/v2/pokemon-species/1/"
        }
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
    "sprites": {
      "back_default":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png",
      "front_default":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"
    }
  };
}
