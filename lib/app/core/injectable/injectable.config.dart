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
    as _i18;
import 'package:pokedex_franq/app/core/rest_client/rest_client.dart' as _i17;
import 'package:pokedex_franq/app/feature/default/data/datasource/default_datasource.dart'
    as _i3;
import 'package:pokedex_franq/app/feature/default/data/repository/default_repository_impl.dart'
    as _i5;
import 'package:pokedex_franq/app/feature/default/domain/repository/default_repository.dart'
    as _i4;
import 'package:pokedex_franq/app/feature/default/domain/usecase/default_usecase.dart'
    as _i6;
import 'package:pokedex_franq/app/feature/home/data/datasource/pokemon_custom_datasource.dart'
    as _i13;
import 'package:pokedex_franq/app/feature/home/data/datasource/pokemon_datasource.dart'
    as _i19;
import 'package:pokedex_franq/app/feature/home/data/repository/pokemon_custom_repository_impl.dart'
    as _i15;
import 'package:pokedex_franq/app/feature/home/data/repository/pokemon_repository_impl.dart'
    as _i21;
import 'package:pokedex_franq/app/feature/home/domain/repository/pokemon_custom_repository.dart'
    as _i14;
import 'package:pokedex_franq/app/feature/home/domain/repository/pokemon_repository.dart'
    as _i20;
import 'package:pokedex_franq/app/feature/home/domain/usecase/pokemon_custom_usecase.dart'
    as _i16;
import 'package:pokedex_franq/app/feature/home/domain/usecase/pokemon_list_usecase.dart'
    as _i23;
import 'package:pokedex_franq/app/feature/home/domain/usecase/pokemon_usecase.dart'
    as _i22;
import 'package:pokedex_franq/app/feature/pokemon_add/data/datasource/pokemon_custom_add_datasource.dart'
    as _i9;
import 'package:pokedex_franq/app/feature/pokemon_add/data/repository/pokemon_custom_repository_impl.dart'
    as _i11;
import 'package:pokedex_franq/app/feature/pokemon_add/domain/repository/pokemon_custom_repository.dart'
    as _i10;
import 'package:pokedex_franq/app/feature/pokemon_add/domain/usecase/pokemon_custom_add_usecase.dart'
    as _i12;
import 'package:pokedex_franq/main_dependencies.dart' as _i24;

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
    gh.lazySingleton<_i9.PokemonCustomAddDatasource>(
        () => _i9.PokemonCustomAddDatasourceImpl());
    gh.lazySingleton<_i10.PokemonCustomAddRepository>(() =>
        _i11.PokemonCustomAddRepositoryImpl(
            datasource: gh<_i9.PokemonCustomAddDatasource>()));
    gh.lazySingleton<_i12.PokemonCustomAddUsecase>(() =>
        _i12.PokemonCustomAddUsecaseImpl(
            gh<_i10.PokemonCustomAddRepository>()));
    gh.lazySingleton<_i13.PokemonCustomDatasource>(
        () => _i13.PokemonCustomDatasourceImpl());
    gh.lazySingleton<_i14.PokemonCustomRepository>(() =>
        _i15.PokemonCustomRepositoryImpl(
            datasource: gh<_i13.PokemonCustomDatasource>()));
    gh.lazySingleton<_i16.PokemonCustomUsecase>(() =>
        _i16.PokemonCustomUsecaseImpl(gh<_i14.PokemonCustomRepository>()));
    gh.lazySingleton<_i17.RestClient>(() => _i18.DioRequestClient());
    gh.lazySingleton<_i19.PokemonDatasource>(
        () => _i19.PokemonDatasourceImpl(gh<_i17.RestClient>()));
    gh.lazySingleton<_i20.PokemonRepository>(() =>
        _i21.PokemonRepositoryImpl(datasource: gh<_i19.PokemonDatasource>()));
    gh.lazySingleton<_i22.PokemonUsecase>(
        () => _i22.PokemonUsecaseImpl(gh<_i20.PokemonRepository>()));
    gh.lazySingleton<_i23.PokemonListUsecase>(
        () => _i23.PokemonListUsecaseImpl(gh<_i20.PokemonRepository>()));
    return this;
  }
}

class _$MainDependencies extends _i24.MainDependencies {}
