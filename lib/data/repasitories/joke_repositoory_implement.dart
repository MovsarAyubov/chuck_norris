import 'package:chuck_norris/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/platform/network_info.dart';
import '../../domain/entities/joke_about_chuck.dart';
import '../../domain/repositories/joke_repository.dart';
import '../sources/jokes_remote_data_sources.dart';

class JokeRepositoryImplement implements JokesRepository {
  final JokeRemoteDataSourseImplement jokeRemoteDataSourseImplement;
  final NetworkInfo networkInfo;

  JokeRepositoryImplement(
      {required this.jokeRemoteDataSourseImplement, required this.networkInfo});

  @override
  Future<Either<Failure, JokeAboutChuck>> getJoke() async {
    try {
      final remoteJoke = await jokeRemoteDataSourseImplement.getJoke();
      return Right(remoteJoke);
    } on ServerExeption {
      return Left(ServerFailure());
    }
  }
}
