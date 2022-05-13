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

class PokedexSplash extends PokedexState {
  const PokedexSplash()
      : super(
          type: PokedexStateType.splash,
        );
}

enum PokedexStateType { success, empty, error, splash }
