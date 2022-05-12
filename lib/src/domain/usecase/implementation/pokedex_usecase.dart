import '../../../data/model/pokedex_model.dart';
import '../../../data/model/pokemon_entry_model.dart';
import '../../../data/model/pokemon_model.dart';
import '../../../data/model/pokemon_species_model.dart';
import '../../../core/resource/data_state.dart';
import '../../../core/util/constants.dart';
import '../../../data/datasource/local/DAOs/pokemon_database.dart';
import '../../entity/pokedex_entity.dart';
import '../../../core/usecase/i_usecase.dart';
import '../../entity/pokemon_entity.dart';
import '../../entity/pokemon_entry_entity.dart';
import '../../repository/i_pokedex_repository.dart';

class PokedexUsecase extends IUsecase<DataState<PokedexEntity>> {
  final IPokedexRepository pokedexRepository;
  final PokemonDatabase pokemonDatabase;

  PokedexUsecase({
    required this.pokedexRepository,
    required this.pokemonDatabase,
  });

  @override
  Future<DataState<PokedexEntity>> call({
    int speciesId = Constants.defaultIntValue,
  }) async {
    final DataState<PokedexEntity> pokedexEntityDataState =
        await pokedexRepository.getPokemonIds();
    switch (pokedexEntityDataState.type) {
      case DataStateType.success:
        await pokemonDatabase.dropDatabase();
        for (PokemonEntryEntity pokemonEntry
            in pokedexEntityDataState.data!.pokemonEntries) {
          await pokemonDatabase.addPokemon(pokemonEntry.pokemon!);
        }
        List<PokemonEntity> pokemonList = await pokemonDatabase.getPokemons();
        for (int i = Constants.initialValue; i < pokemonList.length; i++) {
          pokedexEntityDataState.data!.pokemonEntries[i] =
              (pokedexEntityDataState.data!.pokemonEntries[i]
                      as PokemonEntryModel)
                  .copyWith(
            pokemon: pokemonList[i] as PokemonModel,
          );
        }
        return pokedexEntityDataState;
      case DataStateType.empty:
        return await _getDataSuccess();
      case DataStateType.error:
        return await _getDataSuccess();
    }
  }

  Future<DataState<PokedexEntity>> _getDataSuccess() async {
    List<PokemonEntity> pokemonList = await pokemonDatabase.getPokemons();
    if (pokemonList.isNotEmpty) {
      var dataSuccess = DataSuccess(
        PokedexModel(
          id: Constants.defaultIntValue,
          name: Constants.defaultStringValue,
          isMainSeries: false,
          pokemonEntries: [],
        ),
      );
      for (int i = Constants.initialValue; i < pokemonList.length; i++) {
        dataSuccess.data!.pokemonEntries.add(PokemonEntryModel(
          entryNumber: Constants.defaultIntValue,
          pokemonSpecies: PokemonSpeciesModel(
            name: Constants.defaultStringValue,
            url: Constants.defaultStringValue,
          ),
          pokemon: pokemonList[i] as PokemonModel,
        ));
      }
      return dataSuccess;
    } else {
      return DataEmpty();
    }
  }
}
