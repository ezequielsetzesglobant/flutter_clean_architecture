import 'dart:convert';
import 'dart:io';
import '../../../core/util/constants.dart';
import '../../../core/resource/data_state.dart';
import '../../../domain/entity/pokedex_entity.dart';
import '../../model/pokedex_model.dart';
import 'package:http/http.dart' as http;
import '../../model/pokemon_model.dart';
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
        for (int i = Constants.initialValue;
            i < pokedexModel.pokemonEntries.length;
            i++) {
          pokedexModel.pokemonEntries[i].pokemon =
              await _getPokemon(pokedexModel.pokemonEntries[i].entryNumber);
        }
        return DataSuccess(
          pokedexModel,
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

  Future<PokemonModel> _getPokemon(int id) async {
    try {
      final response =
          await client.get(Uri.parse('${Constants.pokemonUrl}$id'));
      if (response.statusCode == HttpStatus.ok) {
        return PokemonModel.fromJson(json.decode(response.body));
      } else {
        return PokemonModel(sprites: SpritesModel());
      }
    } catch (exception) {
      return PokemonModel(sprites: SpritesModel());
    }
  }
}
