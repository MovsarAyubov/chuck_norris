// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chuck_norris/core/error/exceptions.dart';
import 'package:chuck_norris/data/models/joke_about_chuck_model.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/client.dart';
import 'jokes_remote_data_source.dart';

@LazySingleton(as: JokeRemoteDataSourse)
class JokeRemoteDataSourseImplement implements JokeRemoteDataSourse {
  final MainApi api;
  const JokeRemoteDataSourseImplement({required this.api});

  @override
  Future<JokeAboutChuckModel> getJoke() async {
    final response = await api.client.get(
      Uri.parse("https://api.chucknorris.io/jokes/random"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final joke = json.decode(response.body);
      return JokeAboutChuckModel.fromJson(joke);
    } else {
      throw ServerExeption();
    }
  }
}
