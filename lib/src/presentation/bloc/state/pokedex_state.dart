import '../../../domain/entity/pokedex_entity.dart';

abstract class PokedexState {
  final PokedexEntity? pokedexEntity;
  final String? error;
  final PokedexStateType type;

  const PokedexState({
    this.pokedexEntity,
    this.error,
    required this.type,
  });
}

class PokedexLoading extends PokedexState {
  const PokedexLoading()
      : super(
          type: PokedexStateType.loading,
        );
}

class PokedexSuccess extends PokedexState {
  const PokedexSuccess(PokedexEntity pokedex)
      : super(
          pokedexEntity: pokedex,
          type: PokedexStateType.success,
        );
}

class PokedexEmpty extends PokedexState {
  const PokedexEmpty()
      : super(
          type: PokedexStateType.empty,
        );
}

class PokedexError extends PokedexState {
  const PokedexError(String error)
      : super(
          error: error,
          type: PokedexStateType.error,
        );
}

enum PokedexStateType { loading, success, empty, error }
