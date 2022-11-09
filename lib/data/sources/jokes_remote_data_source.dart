import '../models/joke_about_chuck_model.dart';

abstract class JokeRemoteDataSourse {
  Future<JokeAboutChuckModel> getJoke();
}
