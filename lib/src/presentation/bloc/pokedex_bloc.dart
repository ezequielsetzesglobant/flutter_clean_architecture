import 'dart:async';
import '../../core/resource/data_state.dart';
import '../../core/usecase/i_usecase.dart';
import 'event/pokedex_event.dart';
import 'state/pokedex_state.dart';
import 'interface/i_pokedex_bloc.dart';

class PokedexBloc extends IPokedexBloc {
  final IUsecase pokedexUseCase;
  StreamController<PokedexState> _pokedexStreamController = StreamController();

  @override
  Stream<PokedexState> get pokedexStream => _pokedexStreamController.stream;

  PokedexBloc({required this.pokedexUseCase});

  @override
  Future<void> initialize() async {}

  @override
  void dispose() {
    _pokedexStreamController.close();
  }

  @override
  void getPokedexState(PokedexEvent pokedexEvent) {
    if (pokedexEvent is PokedexGetPokemonIds) {
      _getPokemonIds();
    }
  }

  void _getPokemonIds() async {
    final dataState = await pokedexUseCase();
    if (dataState is DataSuccess) {
      if (dataState.data.pokemonEntries.isNotEmpty) {
        _pokedexStreamController.sink.add(PokedexSuccess(dataState.data));
      } else {
        _pokedexStreamController.sink.add(PokedexEmpty());
      }
    } else {
      _pokedexStreamController.sink.add(PokedexError(dataState.error));
    }
  }
}
