import '../event/pokedex_event.dart';
import '../state/pokedex_state.dart';
import '../../../core/bloc/i_bloc.dart';

abstract class IPokedexBloc extends IBloc {
  void getPokedexState(PokedexEvent pokedexEvent);

  Stream<PokedexState> get pokedexStream;
}
