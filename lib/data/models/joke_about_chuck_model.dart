import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/joke_about_chuck.dart';

part 'joke_about_chuck_model.g.dart';

@JsonSerializable()
class JokeAboutChuckModel extends JokeAboutChuck {
  const JokeAboutChuckModel({required String id, required String value})
      : super(id: id, value: value);

  factory JokeAboutChuckModel.fromJson(Map<String, dynamic> json) =>
      _$JokeAboutChuckModelFromJson(json);

  Map<String, dynamic> toJson() => _$JokeAboutChuckModelToJson(this);
}
