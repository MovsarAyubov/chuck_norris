// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chuck_norris/core/error/exceptions.dart';
import 'package:chuck_norris/data/models/joke_about_chuck_model.dart';
import 'package:http/http.dart' as http;

abstract class JokeRemoteDataSourse {
  // https://api.chucknorris.io/jokes/random

  Future<JokeAboutChuckModel> getJoke();
}

class JokeRemoteDataSourseImplement implements JokeRemoteDataSourse {
  final http.Client client;

  JokeRemoteDataSourseImplement({required this.client});

  @override
  Future<JokeAboutChuckModel> getJoke() async {
    final response = await client.get(
        Uri.parse("https://api.chucknorris.io/jokes/random"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final joke = json.decode(response.body);
      return JokeAboutChuckModel.fromJson(joke);
    } else {
      throw ServerExeption();
    }
  }
}
