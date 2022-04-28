import '../../core/resource/data_state.dart';
import '../../domain/entity/species_entity.dart';
import '../../domain/repository/i_species_repository.dart';
import '../datasource/remote/pokedex_api_service.dart';

class SpeciesRepository extends ISpeciesRepository {
  final PokedexApiService pokedexApiService;

  SpeciesRepository({
    required this.pokedexApiService,
  });

  @override
  Future<DataState<SpeciesEntity>> getSpecies({required int speciesId}) {
    return pokedexApiService.getSpecies(speciesId: speciesId);
  }
}
