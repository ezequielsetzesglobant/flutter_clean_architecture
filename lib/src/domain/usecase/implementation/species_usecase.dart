import '../../../core/resource/data_state.dart';
import '../../../core/usecase/i_usecase.dart';
import '../../../core/util/constants.dart';
import '../../entity/species_entity.dart';
import '../../repository/i_species_repository.dart';

class SpeciesUsecase extends IUsecase<DataState<SpeciesEntity>> {
  final ISpeciesRepository speciesRepository;

  SpeciesUsecase({required this.speciesRepository});

  @override
  Future<DataState<SpeciesEntity>> call(
      {int speciesId = Constants.defaultValue}) {
    return speciesRepository.getSpecies(speciesId: speciesId);
  }
}
