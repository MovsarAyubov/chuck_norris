// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:chuck_norris/domain/repositories/joke_repository.dart';
import 'package:chuck_norris/presentation/cubit/joke_state.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class JokeCubit extends Cubit<JokeState> {
  final JokesRepository repository;
  JokeCubit(this.repository) : super(NoJokeState());

  void loadJoke() async {
    emit(LoadingState());
    final response = await repository.getJoke();
    response.fold(
      (error) => emit(ErrorJokeState()),
      (joke) => emit(
        JokeLoaded(jokeAboutChuck: joke),
      ),
    );
  }
}
