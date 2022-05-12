import 'package:flutter_clean_architecture/src/core/resource/data_state.dart';
import 'package:flutter_clean_architecture/src/core/usecase/i_usecase.dart';
import 'package:flutter_clean_architecture/src/data/datasource/local/DAOs/pokemon_database.dart';
import 'package:flutter_clean_architecture/src/data/datasource/remote/pokedex_api_service.dart';
import 'package:flutter_clean_architecture/src/data/model/pokedex_model.dart';
import 'package:flutter_clean_architecture/src/data/model/pokemon_model.dart';
import 'package:flutter_clean_architecture/src/data/repository/pokedex_repository.dart';
import 'package:flutter_clean_architecture/src/domain/entity/pokedex_entity.dart';
import 'package:flutter_clean_architecture/src/domain/entity/pokemon_entity.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/implementation/pokedex_usecase.dart';
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
  late PokedexRepository repository;
  late MockPokedexApiService pokedexApiService;
  late MockPokemonDatabase database;
  late DataState<PokedexEntity> dataStateSuccess;
  late DataState<PokedexEntity> dataStateFailed;
  late DataState<PokedexEntity> dataStateEmptyList;
  late PokemonModel pokemon;

  setUp(() {
    pokedexApiService = MockPokedexApiService();
    database = MockPokemonDatabase();
    repository = PokedexRepository();
    repository.pokedexApiService = pokedexApiService;
    usecase = PokedexUsecase(
      pokedexRepository: repository,
      pokemonDatabase: database,
    );
    PokedexModel pokedexModel = PokedexModel.fromJson(_getPokedexJson());
    pokemon = PokemonModel.fromJson(_getPokemonJson());
    pokedexModel.pokemonEntries.first =
        pokedexModel.pokemonEntries.first.copyWith(pokemon: pokemon);
    dataStateSuccess = DataSuccess(pokedexModel);
    dataStateFailed = DataFailed('error');
    dataStateEmptyList = DataEmpty();
  });

  group('Check pokedex usecase', () {
    test('Case whit success', () async {
      when(pokedexApiService.getPokemonIds()).thenAnswer(
        (_) async => dataStateSuccess,
      );
      when(database.dropDatabase()).thenAnswer(
        (_) async => true,
      );
      when(database.addPokemon(pokemon)).thenAnswer(
        (_) async => true,
      );
      when(database.getPokemons()).thenAnswer(
        (_) async => [pokemon],
      );

      DataState<PokedexEntity> dataStateResponse = await usecase();

      expect(dataStateResponse.data, dataStateSuccess.data);
      expect(dataStateResponse.error, null);
      expect(dataStateResponse.type, dataStateSuccess.type);
    });

    test('Case error when service fail', () async {
      when(pokedexApiService.getPokemonIds()).thenAnswer(
        (_) async => dataStateFailed,
      );
      when(database.getPokemons()).thenAnswer(
        (_) async => [pokemon],
      );

      DataState<PokedexEntity> dataStateResponse = await usecase();

      expect(dataStateResponse.data?.pokemonEntries.first.pokemon,
          dataStateSuccess.data?.pokemonEntries.first.pokemon);
      expect(dataStateResponse.error, null);
      expect(dataStateResponse.type, dataStateSuccess.type);
    });

    test('Case whit empty list', () async {
      when(pokedexApiService.getPokemonIds()).thenAnswer(
        (_) async => dataStateEmptyList,
      );
      when(database.getPokemons()).thenAnswer(
        (_) async => [pokemon],
      );

      DataState<PokedexEntity> dataStateResponse = await usecase();

      expect(dataStateResponse.data?.pokemonEntries.first.pokemon,
          dataStateSuccess.data?.pokemonEntries.first.pokemon);
      expect(dataStateResponse.error, null);
      expect(dataStateResponse.type, dataStateSuccess.type);
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
