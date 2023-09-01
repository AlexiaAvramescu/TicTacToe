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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<GameCubit, GameState>(
                  builder: (context, state) {
                    return Text(
                      "${state.turn!.name} 's turn",
                      style: const TextStyle(
                          fontSize: 50, color: Color.fromARGB(255, 56, 117, 58), fontStyle: FontStyle.normal),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 300,
              child: BlocBuilder<GameCubit, GameState>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      Center(
                        child: Container(
                          height: 292,
                          width: 292,
                          color: Colors.black,
                        ),
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1.0,
                        ),
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return GameButton(index: index, state: state);
                        },
                      ),
                    ],
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
