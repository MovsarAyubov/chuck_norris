// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/api/client.dart' as _i3;
import 'data/repasitories/joke_repositoory_implement.dart' as _i7;
import 'data/sources/jokes_remote_data_network.dart' as _i5;
import 'data/sources/jokes_remote_data_source.dart' as _i4;
import 'domain/repositories/joke_repository.dart' as _i6;
import 'presentation/cubit/joke_cubit.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.MainApi>(() => _i3.MainApi());
  gh.lazySingleton<_i4.JokeRemoteDataSourse>(
      () => _i5.JokeRemoteDataSourseImplement(api: get<_i3.MainApi>()));
  gh.lazySingleton<_i6.JokesRepository>(() => _i7.JokeRepositoryImplement(
      jokeRemoteDataSourseImplement: get<_i4.JokeRemoteDataSourse>()));
  gh.factory<_i8.JokeCubit>(() => _i8.JokeCubit(get<_i6.JokesRepository>()));
  return get;
}
