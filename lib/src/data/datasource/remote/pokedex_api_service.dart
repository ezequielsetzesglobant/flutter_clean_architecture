import 'dart:convert';
import 'dart:io';
import '../../../domain/entity/species_entity.dart';
import '../../model/color_model.dart';
import '../../model/habitat_model.dart';
import '../../model/pokemon_entry_model.dart';
import '../../../core/util/constants.dart';
import '../../../core/resource/data_state.dart';
import '../../../domain/entity/pokedex_entity.dart';
import '../../model/pokedex_model.dart';
import 'package:http/http.dart' as http;
import '../../model/pokemon_model.dart';
import '../../model/shape_model.dart';
import '../../model/species_model.dart';
import '../../model/sprites_model.dart';

class PokedexApiService {
  final client = http.Client();

  Future<DataState<PokedexEntity>> getPokemonIds() async {
    try {
      final response = await client.get(Uri.parse(Constants.pokedexUrl));
      if (response.statusCode == HttpStatus.ok) {
        final pokedexModel = PokedexModel.fromJson(
          json.decode(response.body),
        );
        await Future.forEach<PokemonEntryModel>(
            pokedexModel.pokemonEntries as List<PokemonEntryModel>,
            (pokemonEntry) async {
          pokemonEntry.pokemon = await _getPokemon(pokemonEntry.entryNumber);
        });
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

  Future<PokemonModel> _getPokemon(int id) async {
    try {
      final response =
          await client.get(Uri.parse('${Constants.pokemonUrl}$id'));
      if (response.statusCode == HttpStatus.ok) {
        return PokemonModel.fromJson(json.decode(response.body));
      } else {
        return PokemonModel(
          sprites: SpritesModel(),
          species: SpeciesModel(
            color: ColorModel(),
            habitat: HabitatModel(),
            shape: ShapeModel(),
          ),
        );
      }
    } catch (exception) {
      return PokemonModel(
        sprites: SpritesModel(),
        species: SpeciesModel(
          color: ColorModel(),
          habitat: HabitatModel(),
          shape: ShapeModel(),
        ),
      );
    }
  }

  Future<DataState<SpeciesEntity>> getSpecies({required int speciesId}) async {
    try {
      final response =
          await client.get(Uri.parse('${Constants.speciesUrl}$speciesId'));
      if (response.statusCode == HttpStatus.ok) {
        final speciesModel = SpeciesModel.fromJson(
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
