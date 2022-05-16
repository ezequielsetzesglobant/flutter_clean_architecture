import '../../core/resource/data_state.dart';
import '../../domain/entity/species_detail_entity.dart';
import '../../domain/repository/i_species_repository.dart';
import '../datasource/remote/pokedex_api_service.dart';

class SpeciesRepository extends ISpeciesRepository {
  PokedexApiService pokedexApiService = PokedexApiService();

  @override
  Future<DataState<SpeciesDetailEntity>> getSpecies({
    required int speciesId,
  }) {
    return pokedexApiService.getSpecies(speciesId: speciesId);
  }
}
