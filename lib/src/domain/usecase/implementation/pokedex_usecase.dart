import '../../../core/resource/data_state.dart';
import '../../../core/util/constants.dart';
import '../../entity/pokedex_entity.dart';
import '../../../core/usecase/i_usecase.dart';
import '../../repository/i_pokedex_repository.dart';

class PokedexUsecase extends IUsecase<DataState<PokedexEntity>> {
  final IPokedexRepository pokedexRepository;

  PokedexUsecase({
    required this.pokedexRepository,
  });

  @override
  Future<DataState<PokedexEntity>> call({
    int speciesId = Constants.defaultValue,
  }) {
    return pokedexRepository.getPokemonIds();
  }
}
