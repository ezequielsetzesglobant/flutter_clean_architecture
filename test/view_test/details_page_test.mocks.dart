import 'dart:async' as _i6;

import 'package:flutter_clean_architecture/src/core/resource/data_state.dart'
    as _i4;
import 'package:flutter_clean_architecture/src/data/datasource/local/DAOs/pokemon_database.dart'
    as _i3;
import 'package:flutter_clean_architecture/src/domain/entity/species_detail_entity.dart'
    as _i7;
import 'package:flutter_clean_architecture/src/domain/repository/i_species_repository.dart'
    as _i2;
import 'package:flutter_clean_architecture/src/domain/usecase/implementation/species_usecase.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;

class _FakeISpeciesRepository_0 extends _i1.Fake
    implements _i2.ISpeciesRepository {}

class _FakePokemonDatabase_1 extends _i1.Fake implements _i3.PokemonDatabase {}

class _FakeDataState_2<T> extends _i1.Fake implements _i4.DataState<T> {}

class MockSpeciesUsecase extends _i1.Mock implements _i5.SpeciesUsecase {
  MockSpeciesUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ISpeciesRepository get speciesRepository =>
      (super.noSuchMethod(Invocation.getter(#speciesRepository),
          returnValue: _FakeISpeciesRepository_0()) as _i2.ISpeciesRepository);

  @override
  _i3.PokemonDatabase get pokemonDatabase =>
      (super.noSuchMethod(Invocation.getter(#pokemonDatabase),
          returnValue: _FakePokemonDatabase_1()) as _i3.PokemonDatabase);

  @override
  _i6.Future<_i4.DataState<_i7.SpeciesDetailEntity>> call(
          {int? speciesId = 0}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#speciesId: speciesId}),
              returnValue: Future<_i4.DataState<_i7.SpeciesDetailEntity>>.value(
                  _FakeDataState_2<_i7.SpeciesDetailEntity>()))
          as _i6.Future<_i4.DataState<_i7.SpeciesDetailEntity>>);
}
