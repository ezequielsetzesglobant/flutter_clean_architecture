import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../model/species_detail_model.dart';
import '../../../../domain/entity/species_detail_entity.dart';
import '../../../../core/util/constants.dart';
import '../../../../domain/entity/pokemon_entity.dart';
import '../../../model/pokemon_model.dart';
import '../../../model/sprites_model.dart';

class PokemonDatabase {
  PokemonDatabase();

  FirebaseFirestore get instanceDatabase => FirebaseFirestore.instance;

  CollectionReference get pokemonCollection =>
      instanceDatabase.collection(Constants.collectionName);

  Future<void> addPokemon(PokemonEntity pokemon) async {
    await pokemonCollection.doc('${pokemon.id}').set(
          PokemonModel(
            id: pokemon.id,
            name: pokemon.name,
            baseExperience: pokemon.baseExperience,
            height: pokemon.height,
            isDefault: pokemon.isDefault,
            order: pokemon.order,
            weight: pokemon.weight,
            sprites: pokemon.sprites as SpritesModel,
          ).toJson(),
        );
  }

  Future<List<PokemonEntity>> getPokemons() async {
    List<PokemonEntity> pokemonList = [];
    QuerySnapshot querySnapshot = await pokemonCollection.get();
    for (var doc in querySnapshot.docs) {
      try {
        pokemonList.add(
          PokemonModel.fromJson(
            doc.data() as Map<String, dynamic>,
          ),
        );
      } catch (e) {
        rethrow;
      }
    }
    return pokemonList;
  }

  Future<void> updatePokemon(String id, SpeciesDetailEntity species) async {
    final pokemon = await _getPokemon(id);
    await pokemonCollection.doc(id).update(
          (pokemon.copyWith(speciesDetail: species as SpeciesDetailModel)
                  as PokemonModel)
              .toJson(),
        );
  }

  Future<PokemonModel> _getPokemon(String id) async {
    final asyncSnapshot = await pokemonCollection.doc(id).get();
    return PokemonModel.fromJson(
      asyncSnapshot.data() as Map<String, dynamic>,
    );
  }

  Future<SpeciesDetailEntity?> getSpecies(String id) async {
    final asyncSnapshot = await pokemonCollection.doc(id).get();
    return PokemonModel.fromJson(
      asyncSnapshot.data() as Map<String, dynamic>,
    ).speciesDetail;
  }

  Future<void> dropDatabase() async {
    await pokemonCollection.get().then(
      (value) {
        for (QueryDocumentSnapshot<Object?> doc in value.docs) {
          doc.reference.delete();
        }
      },
    );
  }
}
