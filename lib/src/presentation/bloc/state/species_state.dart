import '../../../domain/entity/species_entity.dart';

abstract class SpeciesState {
  final SpeciesEntity? speciesEntity;
  final String? error;
  final SpeciesStateType type;

  const SpeciesState({
    this.speciesEntity,
    this.error,
    required this.type,
  });
}

class SpeciesLoading extends SpeciesState {
  const SpeciesLoading() : super(type: SpeciesStateType.loading);
}

class SpeciesSuccess extends SpeciesState {
  const SpeciesSuccess(SpeciesEntity species)
      : super(speciesEntity: species, type: SpeciesStateType.success);
}

class SpeciesEmpty extends SpeciesState {
  const SpeciesEmpty() : super(type: SpeciesStateType.empty);
}

class SpeciesError extends SpeciesState {
  const SpeciesError(String error)
      : super(error: error, type: SpeciesStateType.error);
}

enum SpeciesStateType { loading, success, empty, error }
