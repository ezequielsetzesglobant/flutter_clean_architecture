import 'dart:async' as _i5;

import 'package:flutter_clean_architecture/src/core/resource/data_state.dart'
    as _i3;
import 'package:flutter_clean_architecture/src/data/datasource/remote/pokedex_api_service.dart'
    as _i4;
import 'package:flutter_clean_architecture/src/domain/entity/pokedex_entity.dart'
    as _i6;
import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

class _FakeClient_0 extends _i1.Fake implements _i2.Client {}

class _FakeDataState_1<T> extends _i1.Fake implements _i3.DataState<T> {}

class MockPokedexApiService extends _i1.Mock implements _i4.PokedexApiService {
  MockPokedexApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Client get client => (super.noSuchMethod(Invocation.getter(#client),
      returnValue: _FakeClient_0()) as _i2.Client);

  @override
  _i5.Future<_i3.DataState<_i6.PokedexEntity>> getPokemonIds() =>
      (super.noSuchMethod(Invocation.method(#getPokemonIds, []),
              returnValue: Future<_i3.DataState<_i6.PokedexEntity>>.value(
                  _FakeDataState_1<_i6.PokedexEntity>()))
          as _i5.Future<_i3.DataState<_i6.PokedexEntity>>);
}
