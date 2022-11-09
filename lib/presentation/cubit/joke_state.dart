// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:chuck_norris/domain/entities/joke_about_chuck.dart';

abstract class JokeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NoJokeState extends JokeState {
  NoJokeState();
  @override
  List<Object?> get props => [];
}

class LoadingState extends JokeState {
  LoadingState();
  @override
  List<Object?> get props => [];
}

class JokeLoaded extends JokeState {
  final JokeAboutChuck jokeAboutChuck;
  JokeLoaded({
    required this.jokeAboutChuck,
  });
  @override
  List<Object?> get props => [jokeAboutChuck];
}
