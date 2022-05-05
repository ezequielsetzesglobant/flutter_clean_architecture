import 'dart:async' as _i5;

import 'package:flutter_clean_architecture/src/core/resource/data_state.dart'
    as _i3;
import 'package:flutter_clean_architecture/src/domain/entity/species_entity.dart'
    as _i6;
import 'package:flutter_clean_architecture/src/domain/repository/i_species_repository.dart'
    as _i2;
import 'package:flutter_clean_architecture/src/domain/usecase/implementation/species_usecase.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

class _FakeISpeciesRepository_0 extends _i1.Fake
    implements _i2.ISpeciesRepository {}

class _FakeDataState_1<T> extends _i1.Fake implements _i3.DataState<T> {}

class MockSpeciesUsecase extends _i1.Mock implements _i4.SpeciesUsecase {
  MockSpeciesUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ISpeciesRepository get speciesRepository =>
      (super.noSuchMethod(Invocation.getter(#speciesRepository),
          returnValue: _FakeISpeciesRepository_0()) as _i2.ISpeciesRepository);

  @override
  _i5.Future<_i3.DataState<_i6.SpeciesEntity>> call({int? speciesId = 0}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#speciesId: speciesId}),
              returnValue: Future<_i3.DataState<_i6.SpeciesEntity>>.value(
                  _FakeDataState_1<_i6.SpeciesEntity>()))
          as _i5.Future<_i3.DataState<_i6.SpeciesEntity>>);
}
