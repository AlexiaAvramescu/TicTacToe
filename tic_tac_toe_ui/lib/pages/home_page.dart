import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe_ui/cubit/game_cubit.dart';
import 'package:tic_tac_toe_ui/models/meniu_button_model.dart';
import 'package:tic_tac_toe_ui/pages/difficulty_page.dart';
import 'package:tic_tac_toe_ui/pages/game_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 163, 240, 210),
      body: Center(
        child: SizedBox(
            width: 200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40, left: 30, right: 20),
                  child: const Text(
                    'XO Game',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  // mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MeniuButton(
                      name: 'Single Player',
                      icon: const Icon(Icons.person),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DificultyPage()));
                      },
                    ),
                    const SizedBox(height: 20),
                    MeniuButton(
                      name: 'Multiplayer',
                      icon: const Icon(Icons.people),
                      onPressed: () {
                        context.read<GameCubit>().restart();
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
