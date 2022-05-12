import '../../../core/resource/data_state.dart';
import '../../../core/usecase/i_usecase.dart';
import '../../../core/util/constants.dart';
import '../../../data/datasource/local/DAOs/pokemon_database.dart';
import '../../entity/species_detail_entity.dart';
import '../../repository/i_species_repository.dart';

class SpeciesUsecase extends IUsecase<DataState<SpeciesDetailEntity>> {
  final ISpeciesRepository speciesRepository;
  final PokemonDatabase pokemonDatabase;

  SpeciesUsecase({
    required this.speciesRepository,
    required this.pokemonDatabase,
  });

  @override
  Future<DataState<SpeciesDetailEntity>> call({
    int speciesId = Constants.defaultIntValue,
  }) async {
    final DataState<SpeciesDetailEntity> speciesEntityDataState =
        await speciesRepository.getSpecies(speciesId: speciesId);
    switch (speciesEntityDataState.type) {
      case DataStateType.success:
        await pokemonDatabase.updatePokemon(
            '${speciesId}', speciesEntityDataState.data!);
        final species = await pokemonDatabase.getSpecies('${speciesId}');
        return DataSuccess(species!);
      case DataStateType.error:
        final species = await pokemonDatabase.getSpecies('${speciesId}');
        return species != null
            ? DataSuccess(species)
            : DataFailed(Constants.detailsErrorMessage);
      default:
        final species = await pokemonDatabase.getSpecies('${speciesId}');
        return species != null
            ? DataSuccess(species)
            : DataFailed(Constants.detailsErrorMessage);
    }
  }
}
