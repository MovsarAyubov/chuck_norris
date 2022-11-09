import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/joke_about_chuck.dart';

abstract class JokesRepository {
  Future<Either<Failure, JokeAboutChuck>> getJoke();
}
