import 'pokemon_entity.dart';
import 'pokemon_species_entity.dart';

class PokemonEntryEntity {
  PokemonEntryEntity({
    required this.entryNumber,
    required this.pokemonSpecies,
    this.pokemon,
  });

  int entryNumber;
  PokemonSpeciesEntity pokemonSpecies;
  PokemonEntity? pokemon;
}
