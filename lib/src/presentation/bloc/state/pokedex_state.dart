import '../../../domain/entity/pokedex_entity.dart';

abstract class PokedexState {
  final PokedexEntity? pokedex_entity;
  final String? error;

  const PokedexState({this.pokedex_entity, this.error});
}

class PokedexLoading extends PokedexState {
  const PokedexLoading();
}

class PokedexSuccess extends PokedexState {
  const PokedexSuccess(PokedexEntity pokedex) : super(pokedex_entity: pokedex);
}

class PokedexEmpty extends PokedexState {
  const PokedexEmpty();
}

class PokedexError extends PokedexState {
  const PokedexError(String error) : super(error: error);
}
