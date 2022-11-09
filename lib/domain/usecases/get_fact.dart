import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';
import '../entities/joke_about_chuck.dart';
import '../repositories/joke_repository.dart';

class GetJoke extends UseCase<JokeAboutChuck, NoParams> {
  final JokesRepository factsRepository;
  const GetJoke({required this.factsRepository});

  @override
  Future<Either<Failure, JokeAboutChuck>> call(NoParams params) async {
    return await factsRepository.getJoke();
  }
}
