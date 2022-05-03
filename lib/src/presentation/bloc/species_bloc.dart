import 'dart:async';
import '../../core/resource/data_state.dart';
import '../../core/usecase/i_usecase.dart';
import '../../domain/entity/pokemon_entity.dart';
import 'event/species_event.dart';
import 'interface/i_species_bloc.dart';
import 'state/species_state.dart';

class SpeciesBloc extends ISpeciesBloc {
  final IUsecase speciesUseCase;
  StreamController<SpeciesState> _pokedexStreamController = StreamController();

  @override
  Stream<SpeciesState> get speciesStream => _pokedexStreamController.stream;

  SpeciesBloc({required this.speciesUseCase});

  @override
  Future<void> initialize() async {}

  @override
  void dispose() {
    _pokedexStreamController.close();
  }

  @override
  void getSpeciesState({
    required SpeciesEvent speciesEvent,
    required PokemonEntity pokemonEntity,
  }) {
    if (speciesEvent is SpeciesGetSpecies) {
      _getSpecies(pokemonEntity: pokemonEntity);
    }
  }

  void _getSpecies({required PokemonEntity pokemonEntity}) async {
    final dataState = await speciesUseCase(speciesId: pokemonEntity.id);
    switch (dataState.type) {
      case DataStateType.success:
        pokemonEntity.species = dataState.data;
        _pokedexStreamController.sink.add(SpeciesSuccess(pokemonEntity));
        break;
      case DataStateType.error:
        _pokedexStreamController.sink.add(SpeciesError(dataState.error));
        break;
    }
  }
}
