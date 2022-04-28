import '../../core/resource/data_state.dart';
import '../entity/species_entity.dart';

abstract class ISpeciesRepository {
  Future<DataState<SpeciesEntity>> getSpecies({required int speciesId});
}
