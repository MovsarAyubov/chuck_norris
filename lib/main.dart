import 'package:chuck_norris/presentation/pages/home_page.dart';
import 'package:chuck_norris/setup.dart';
import 'package:flutter/material.dart';

void main() async {
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: const TextTheme(
              bodyText1: TextStyle(
                fontSize: 30,
              ),
              bodyText2: TextStyle(
                fontSize: 22,
              ))),
      home: const HomePage(),
    );
  }
}
