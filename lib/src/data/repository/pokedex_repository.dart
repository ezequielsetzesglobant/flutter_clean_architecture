import '../../core/resource/data_state.dart';
import '../datasource/remote/pokedex_api_service.dart';
import '../../domain/entity/pokedex_entity.dart';
import '../../domain/repository/i_pokedex_repository.dart';

class PokedexRepository extends IPokedexRepository {
  final PokedexApiService pokedexApiService;

  PokedexRepository({
    required this.pokedexApiService,
  });

  @override
  Future<DataState<PokedexEntity>> getPokemonIds() {
    return pokedexApiService.getPokemonIds();
  }
}
