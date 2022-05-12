import 'dart:convert';
import 'dart:io';
import '../../../domain/entity/species_detail_entity.dart';
import '../../../core/util/constants.dart';
import '../../../core/resource/data_state.dart';
import '../../../domain/entity/pokedex_entity.dart';
import '../../model/pokedex_model.dart';
import 'package:http/http.dart' as http;
import '../../model/pokemon_model.dart';
import '../../model/species_detail_model.dart';

class PokedexApiService {
  final client = http.Client();

  Future<DataState<PokedexEntity>> getPokemonIds() async {
    try {
      final response = await client.get(Uri.parse(Constants.pokedexUrl));
      if (response.statusCode == HttpStatus.ok) {
        final pokedexModel = PokedexModel.fromJson(
          json.decode(response.body),
        );
        for (int i = Constants.initialValue;
            i < pokedexModel.pokemonEntries.length;
            i++) {
          pokedexModel.pokemonEntries[i] =
              pokedexModel.pokemonEntries[i].copyWith(
            pokemon:
                await _getPokemon(pokedexModel.pokemonEntries[i].entryNumber),
          );
        }
        pokedexModel.pokemonEntries
            .removeWhere((pokemonEntry) => pokemonEntry.pokemon == null);
        if (pokedexModel.pokemonEntries.isNotEmpty) {
          return DataSuccess(
            pokedexModel,
          );
        } else {
          return DataEmpty();
        }
      } else {
        return const DataFailed(
          Constants.requestError,
        );
      }
    } catch (exception) {
      return const DataFailed(
        Constants.requestError,
      );
    }
  }

  Future<PokemonModel?> _getPokemon(int id) async {
    try {
      final response =
          await client.get(Uri.parse('${Constants.pokemonUrl}$id'));
      if (response.statusCode == HttpStatus.ok) {
        return PokemonModel.fromJson(json.decode(response.body));
      }
    } catch (exception) {
      rethrow;
    }
    return null;
  }

  Future<DataState<SpeciesDetailEntity>> getSpecies({
    required int speciesId,
  }) async {
    try {
      final response =
          await client.get(Uri.parse('${Constants.speciesUrl}$speciesId'));
      if (response.statusCode == HttpStatus.ok) {
        final speciesModel = SpeciesDetailModel.fromJson(
          json.decode(response.body),
        );
        return DataSuccess(
          speciesModel,
        );
      } else {
        return const DataFailed(
          Constants.requestError,
        );
      }
    } catch (exception) {
      return const DataFailed(
        Constants.requestError,
      );
    }
  }
}
