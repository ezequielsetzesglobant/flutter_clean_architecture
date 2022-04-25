import 'pokemon_entry_model.dart';
import '../../domain/entity/pokedex_entity.dart';

class PokedexModel extends PokedexEntity {
  PokedexModel({
    required int id,
    required String name,
    required bool isMainSeries,
    required List<PokemonEntryModel> pokemonEntries,
  }) : super(
          id: id,
          name: name,
          isMainSeries: isMainSeries,
          pokemonEntries: pokemonEntries,
        );

  factory PokedexModel.fromJson(Map<String, dynamic> json) {
    var jsonList = json['pokemon_entries'] as List;
    List<PokemonEntryModel> pokedexEntriesModel = jsonList
        .map((pokedexEntryModel) =>
            PokemonEntryModel.fromJson(pokedexEntryModel))
        .toList();
    return PokedexModel(
      id: json['id'],
      name: json['name'],
      isMainSeries: json['is_main_series'],
      pokemonEntries: pokedexEntriesModel,
    );
  }
}
