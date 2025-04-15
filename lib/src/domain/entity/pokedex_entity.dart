import 'pokemon_entry_entity.dart';

class PokedexEntity {
  PokedexEntity({
    required this.id,
    required this.name,
    required this.isMainSeries,
    required this.pokemonEntries,
  });

  final int id;
  final String name;
  final bool isMainSeries;
  final List<PokemonEntryEntity> pokemonEntries;
}
