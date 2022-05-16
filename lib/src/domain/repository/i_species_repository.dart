import '../../core/resource/data_state.dart';
import '../entity/species_detail_entity.dart';

abstract class ISpeciesRepository {
  Future<DataState<SpeciesDetailEntity>> getSpecies({
    required int speciesId,
  });
}
