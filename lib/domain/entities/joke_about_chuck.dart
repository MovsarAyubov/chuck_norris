import 'package:equatable/equatable.dart';

class JokeAboutChuck extends Equatable {
  final String value;
  final String id;

  const JokeAboutChuck({required this.value, required this.id});

  @override
  List<Object> get props => [value, id];
}
