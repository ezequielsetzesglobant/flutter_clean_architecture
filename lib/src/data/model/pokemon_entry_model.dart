import 'pokemon_species_model.dart';
import 'pokemon_model.dart';
import '../../domain/entity/pokemon_entry_entity.dart';

class PokemonEntryModel extends PokemonEntryEntity {
  PokemonEntryModel({
    required this.entryNumber,
    required this.pokemonSpecies,
    this.pokemon,
  }) : super(
          entryNumber: entryNumber,
          pokemonSpecies: pokemonSpecies,
          pokemon: pokemon,
        );

  factory PokemonEntryModel.fromJson(Map<String, dynamic> json) {
    return PokemonEntryModel(
      entryNumber: json['entry_number'],
      pokemonSpecies: PokemonSpeciesModel.fromJson(json['pokemon_species']),
    );
  }

  final int entryNumber;
  final PokemonSpeciesModel pokemonSpecies;
  final PokemonModel? pokemon;

  PokemonEntryModel copyWith({
    int? entryNumber,
    PokemonSpeciesModel? pokemonSpecies,
    PokemonModel? pokemon,
  }) {
    return PokemonEntryModel(
      entryNumber: entryNumber ?? this.entryNumber,
      pokemonSpecies: pokemonSpecies ?? pokemonSpecies ?? this.pokemonSpecies,
      pokemon: pokemon ?? this.pokemon,
    );
  }
}
