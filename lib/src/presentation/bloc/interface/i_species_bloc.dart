import '../../../domain/entity/pokemon_entity.dart';
import '../../../core/bloc/i_bloc.dart';
import '../event/species_event.dart';
import '../state/species_state.dart';

abstract class ISpeciesBloc extends IBloc {
  void getSpeciesState(
      {required SpeciesEvent speciesEvent,
      required PokemonEntity pokemonEntity});

  Stream<SpeciesState> get speciesStream;
}
