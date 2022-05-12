import 'dart:async' as _i6;

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:flutter_clean_architecture/src/core/resource/data_state.dart'
    as _i3;
import 'package:flutter_clean_architecture/src/data/datasource/local/DAOs/pokemon_database.dart'
    as _i9;
import 'package:flutter_clean_architecture/src/data/datasource/remote/pokedex_api_service.dart'
    as _i5;
import 'package:flutter_clean_architecture/src/domain/entity/pokedex_entity.dart'
    as _i7;
import 'package:flutter_clean_architecture/src/domain/entity/pokemon_entity.dart'
    as _i10;
import 'package:flutter_clean_architecture/src/domain/entity/species_detail_entity.dart'
    as _i8;
import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

class _FakeClient_0 extends _i1.Fake implements _i2.Client {}

class _FakeDataState_1<T> extends _i1.Fake implements _i3.DataState<T> {}

class _FakeFirebaseFirestore_2 extends _i1.Fake
    implements _i4.FirebaseFirestore {}

class _FakeCollectionReference_3<T extends Object?> extends _i1.Fake
    implements _i4.CollectionReference<T> {}

class MockPokedexApiService extends _i1.Mock implements _i5.PokedexApiService {
  MockPokedexApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Client get client => (super.noSuchMethod(Invocation.getter(#client),
      returnValue: _FakeClient_0()) as _i2.Client);

  @override
  _i6.Future<_i3.DataState<_i7.PokedexEntity>> getPokemonIds() =>
      (super.noSuchMethod(Invocation.method(#getPokemonIds, []),
              returnValue: Future<_i3.DataState<_i7.PokedexEntity>>.value(
                  _FakeDataState_1<_i7.PokedexEntity>()))
          as _i6.Future<_i3.DataState<_i7.PokedexEntity>>);

  @override
  _i6.Future<_i3.DataState<_i8.SpeciesDetailEntity>> getSpecies(
          {int? speciesId}) =>
      (super.noSuchMethod(
              Invocation.method(#getSpecies, [], {#speciesId: speciesId}),
              returnValue: Future<_i3.DataState<_i8.SpeciesDetailEntity>>.value(
                  _FakeDataState_1<_i8.SpeciesDetailEntity>()))
          as _i6.Future<_i3.DataState<_i8.SpeciesDetailEntity>>);
}

class MockPokemonDatabase extends _i1.Mock implements _i9.PokemonDatabase {
  MockPokemonDatabase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.FirebaseFirestore get instanceDatabase =>
      (super.noSuchMethod(Invocation.getter(#instanceDatabase),
          returnValue: _FakeFirebaseFirestore_2()) as _i4.FirebaseFirestore);

  @override
  _i4.CollectionReference<Object?> get pokemonCollection =>
      (super.noSuchMethod(Invocation.getter(#pokemonCollection),
              returnValue: _FakeCollectionReference_3<Object?>())
          as _i4.CollectionReference<Object?>);

  @override
  _i6.Future<void> addPokemon(_i10.PokemonEntity? pokemon) =>
      (super.noSuchMethod(Invocation.method(#addPokemon, [pokemon]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);

  @override
  _i6.Future<List<_i10.PokemonEntity>> getPokemons() => (super.noSuchMethod(
          Invocation.method(#getPokemons, []),
          returnValue:
              Future<List<_i10.PokemonEntity>>.value(<_i10.PokemonEntity>[]))
      as _i6.Future<List<_i10.PokemonEntity>>);

  @override
  _i6.Future<void> updatePokemon(
          String? id, _i8.SpeciesDetailEntity? species) =>
      (super.noSuchMethod(Invocation.method(#updatePokemon, [id, species]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);

  @override
  _i6.Future<_i8.SpeciesDetailEntity?> getSpecies(String? id) =>
      (super.noSuchMethod(Invocation.method(#getSpecies, [id]),
              returnValue: Future<_i8.SpeciesDetailEntity?>.value())
          as _i6.Future<_i8.SpeciesDetailEntity?>);

  @override
  _i6.Future<void> dropDatabase() =>
      (super.noSuchMethod(Invocation.method(#dropDatabase, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
}
