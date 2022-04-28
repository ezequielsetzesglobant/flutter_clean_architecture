import '../../../core/bloc/i_bloc.dart';
import '../event/species_event.dart';
import '../state/species_state.dart';

abstract class ISpeciesBloc extends IBloc {
  void getSpeciesState(
      {required SpeciesEvent speciesEvent, required int speciesId});

  Stream<SpeciesState> get speciesStream;
}
