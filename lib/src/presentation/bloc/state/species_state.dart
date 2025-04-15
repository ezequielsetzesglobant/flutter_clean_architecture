import '../../../domain/entity/pokemon_entity.dart';

abstract class SpeciesState {
  final PokemonEntity? pokemonEntity;
  final String? error;
  final SpeciesStateType type;

  const SpeciesState({
    this.pokemonEntity,
    this.error,
    required this.type,
  });
}

class SpeciesLoading extends SpeciesState {
  const SpeciesLoading() : super(type: SpeciesStateType.loading);
}

class SpeciesSuccess extends SpeciesState {
  const SpeciesSuccess(PokemonEntity pokemonEntity)
      : super(pokemonEntity: pokemonEntity, type: SpeciesStateType.success);
}

class SpeciesError extends SpeciesState {
  const SpeciesError(String error)
      : super(error: error, type: SpeciesStateType.error);
}

enum SpeciesStateType {
  loading,
  success,
  error,
}
