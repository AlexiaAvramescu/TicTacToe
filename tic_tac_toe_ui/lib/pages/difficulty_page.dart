import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';
import 'package:tic_tac_toe_ui/cubit/game_cubit.dart';
import 'package:tic_tac_toe_ui/models/meniu_button_model.dart';
import 'package:tic_tac_toe_ui/pages/game_page.dart';

class DificultyPage extends StatelessWidget {
  const DificultyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 163, 240, 210),
      ),
      backgroundColor: const Color.fromARGB(255, 163, 240, 210),
      body: Center(
        child: SizedBox(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40, left: 30, right: 20),
                  child: const Text(
                    'Difficulty',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    MeniuButton(
                      name: 'Hard',
                      onPressed: () {
                        context.read<GameCubit>().restart();
                        context.read<GameCubit>().setStrategy(EStrategy.hard);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const GamePage()));
                      },
                    ),
                    const SizedBox(height: 20),
                    MeniuButton(
                      name: 'Medium',
                      onPressed: () {
                        context.read<GameCubit>().restart();
                        context.read<GameCubit>().setStrategy(EStrategy.medium);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const GamePage()));
                      },
                    ),
                    const SizedBox(height: 20),
                    MeniuButton(
                      name: 'Easy',
                      onPressed: () {
                        context.read<GameCubit>().restart();
                        context.read<GameCubit>().setStrategy(EStrategy.easy);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const GamePage()));
                      },
                    ),
                    const SizedBox(height: 60),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
