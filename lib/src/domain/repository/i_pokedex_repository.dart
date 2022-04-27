import '../../core/resource/data_state.dart';
import '../entity/pokedex_entity.dart';

abstract class IPokedexRepository {
  Future<DataState<PokedexEntity>> getPokemonIds();
}
