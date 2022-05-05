import 'dart:async' as _i5;

import 'package:flutter_clean_architecture/src/core/resource/data_state.dart'
    as _i3;
import 'package:flutter_clean_architecture/src/domain/entity/pokedex_entity.dart'
    as _i6;
import 'package:flutter_clean_architecture/src/domain/repository/i_pokedex_repository.dart'
    as _i2;
import 'package:flutter_clean_architecture/src/domain/usecase/implementation/pokedex_usecase.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

class _FakeIPokedexRepository_0 extends _i1.Fake
    implements _i2.IPokedexRepository {}

class _FakeDataState_1<T> extends _i1.Fake implements _i3.DataState<T> {}

class MockPokedexUsecase extends _i1.Mock implements _i4.PokedexUsecase {
  MockPokedexUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IPokedexRepository get pokedexRepository =>
      (super.noSuchMethod(Invocation.getter(#pokedexRepository),
          returnValue: _FakeIPokedexRepository_0()) as _i2.IPokedexRepository);

  @override
  _i5.Future<_i3.DataState<_i6.PokedexEntity>> call({int? speciesId = 0}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#speciesId: speciesId}),
              returnValue: Future<_i3.DataState<_i6.PokedexEntity>>.value(
                  _FakeDataState_1<_i6.PokedexEntity>()))
          as _i5.Future<_i3.DataState<_i6.PokedexEntity>>);
}
