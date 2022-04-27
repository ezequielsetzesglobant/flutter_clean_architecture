import 'pokemon_entry_entity.dart';

class PokedexEntity {
  PokedexEntity({
    required this.id,
    required this.name,
    required this.isMainSeries,
    required this.pokemonEntries,
  });

  int id;
  String name;
  bool isMainSeries;
  List<PokemonEntryEntity> pokemonEntries;
}
