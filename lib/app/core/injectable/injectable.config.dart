// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_analytics/firebase_analytics.dart' as _i7;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pokedex_franq/app/core/rest_client/dio_rest_client.dart'
    as _i10;
import 'package:pokedex_franq/app/core/rest_client/rest_client.dart' as _i9;
import 'package:pokedex_franq/app/feature/default/data/datasource/default_datasource.dart'
    as _i3;
import 'package:pokedex_franq/app/feature/default/data/repository/default_repository_impl.dart'
    as _i5;
import 'package:pokedex_franq/app/feature/default/domain/repository/default_repository.dart'
    as _i4;
import 'package:pokedex_franq/app/feature/default/domain/usecase/default_usecase.dart'
    as _i6;
import 'package:pokedex_franq/app/feature/home/data/datasource/pokemon_datasource.dart'
    as _i11;
import 'package:pokedex_franq/app/feature/home/data/repository/pokemon_repository_impl.dart'
    as _i13;
import 'package:pokedex_franq/app/feature/home/domain/repository/pokemon_repository.dart'
    as _i12;
import 'package:pokedex_franq/app/feature/home/domain/usecase/pokemon_list_usecase.dart'
    as _i15;
import 'package:pokedex_franq/app/feature/home/domain/usecase/pokemon_usecase.dart'
    as _i14;
import 'package:pokedex_franq/main_dependencies.dart' as _i16;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final mainDependencies = _$MainDependencies();
    gh.lazySingleton<_i3.DefaultDatasource>(() => _i3.DefaultDatasourceImpl());
    gh.lazySingleton<_i4.DefaultRepository>(() =>
        _i5.DefaultRepositoryImpl(datasource: gh<_i3.DefaultDatasource>()));
    gh.lazySingleton<_i6.DefaultUsecase>(
        () => _i6.DefaultUsecaseImpl(repository: gh<_i4.DefaultRepository>()));
    gh.lazySingleton<_i7.FirebaseAnalytics>(
        () => mainDependencies.firebaseAnalytics);
    gh.lazySingleton<_i8.FirebaseCrashlytics>(
        () => mainDependencies.firebaseCrashlytics);
    gh.lazySingleton<_i9.RestClient>(() => _i10.DioRequestClient());
    gh.lazySingleton<_i11.PokemonDatasource>(
        () => _i11.PokemonDatasourceImpl(gh<_i9.RestClient>()));
    gh.lazySingleton<_i12.PokemonRepository>(() =>
        _i13.PokemonRepositoryImpl(datasource: gh<_i11.PokemonDatasource>()));
    gh.lazySingleton<_i14.PokemonUsecase>(
        () => _i14.PokemonUsecaseImpl(gh<_i12.PokemonRepository>()));
    gh.lazySingleton<_i15.PokemonListUsecase>(
        () => _i15.PokemonListUsecaseImpl(gh<_i12.PokemonRepository>()));
    return this;
  }
}

class _$MainDependencies extends _i16.MainDependencies {}
