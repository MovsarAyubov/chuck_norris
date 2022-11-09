import 'package:chuck_norris/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failure.dart';
import '../../domain/entities/joke_about_chuck.dart';
import '../../domain/repositories/joke_repository.dart';
import '../sources/jokes_remote_data_source.dart';

@LazySingleton(as: JokesRepository)
class JokeRepositoryImplement implements JokesRepository {
  final JokeRemoteDataSourse jokeRemoteDataSourseImplement;
  const JokeRepositoryImplement({required this.jokeRemoteDataSourseImplement});

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
