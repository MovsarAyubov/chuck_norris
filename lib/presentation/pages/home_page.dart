import '../../setup.dart';
import '../cubit/joke_cubit.dart';
import '../cubit/joke_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/my_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final jokeCubit = getIt<JokeCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          jokeCubit.loadJoke();
        },
        label: const Text("Get joke"),
      ),
      appBar: const MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                  height: 100,
                  width: 200,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(
                        "https://api.chucknorris.io/img/chucknorris_logo_coloured_small.png"),
                  )),
            ),
            const SizedBox(
              height: 100,
            ),
            BlocBuilder<JokeCubit, JokeState>(
              bloc: jokeCubit,
              builder: (context, state) {
                if (state is LoadingState) {
                  return const CircularProgressIndicator();
                } else if (state is JokeLoaded) {
                  return Text(state.jokeAboutChuck.value);
                }
                return const Text("Joke is not loaded");
              },
            ),
          ],
        ),
      ),
    );
  }
}
