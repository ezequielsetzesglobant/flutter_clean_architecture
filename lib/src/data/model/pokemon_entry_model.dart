import '../../core/util/constants.dart';
import 'sprites_model.dart';
import 'pokemon_species_model.dart';
import 'pokemon_model.dart';
import '../../domain/entity/pokemon_entry_entity.dart';

class PokemonEntryModel extends PokemonEntryEntity {
  PokemonEntryModel({
    required int entryNumber,
    required PokemonSpeciesModel pokemonSpecies,
    required PokemonModel pokemon,
  }) : super(
          entryNumber: entryNumber,
          pokemonSpecies: pokemonSpecies,
          pokemon: pokemon,
        );

  factory PokemonEntryModel.fromJson(Map<String, dynamic> json) {
    return PokemonEntryModel(
      entryNumber: json['entry_number'],
      pokemonSpecies: PokemonSpeciesModel.fromJson(json['pokemon_species']),
      pokemon: PokemonModel(sprites: SpritesModel()),
    );
  }
}
