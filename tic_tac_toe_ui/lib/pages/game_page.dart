import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe_ui/cubit/game_cubit.dart';
import 'package:tic_tac_toe_ui/cubit/game_state.dart';
import 'package:tic_tac_toe_ui/models/game_button_model.dart';
import 'package:tic_tac_toe_ui/models/meniu_button_model.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 163, 240, 210),
      ),
      backgroundColor: const Color.fromARGB(255, 163, 240, 210),
      body: Center(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Who's turn is it.",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 300,
              child: BlocBuilder<GameCubit, GameState>(
                builder: (context, state) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return GameButton(index: index, state: state);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MeniuButton(
                    name: 'Restart',
                    onPressed: () {
                      context.read<GameCubit>().restart();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
