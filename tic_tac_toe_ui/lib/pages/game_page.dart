import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';
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
            SizedBox(
              height: 50,
            ),
            _turnText(),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 300,
              child: BlocConsumer<GameCubit, GameState>(
                listener: (context, state) {
                  if (state.state != EGameState.playing) _gameOverDialog(context: context, state: state.state);
                },
                builder: (context, state) {
                  return BlocBuilder<GameCubit, GameState>(
                    builder: (context, state) {
                      return _board(state);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            _restartButton(context)
          ],
        ),
      ),
    );
  }

  Row _restartButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MeniuButton(
            icon: Icon(Icons.refresh_rounded),
            name: 'Restart',
            onPressed: () {
              context.read<GameCubit>().restart();
            }),
      ],
    );
  }

  Stack _board(GameState state) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: 290,
            width: 290,
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
  }

  Row _turnText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<GameCubit, GameState>(
          builder: (context, state) {
            return Text(
              "${state.turn!.name} 's turn",
              style:
                  const TextStyle(fontSize: 50, color: Color.fromARGB(255, 56, 117, 58), fontStyle: FontStyle.normal),
            );
          },
        ),
      ],
    );
  }

  void _gameOverDialog({required BuildContext context, required EGameState? state}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.002, sigmaY: 0.002),
            child: AlertDialog(
              backgroundColor: Color.fromARGB(255, 38, 209, 181),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Game Over', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600)),
                ],
              ),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Builder(
                    builder: (context) {
                      if (state == EGameState.xWon) return Text('Player X won!', style: TextStyle(fontSize: 25));
                      if (state == EGameState.oWon) return Text('Player O won!', style: TextStyle(fontSize: 25));
                      return Text('Draw.', style: TextStyle(fontSize: 25));
                    },
                  )
                ],
              ),
              actions: [
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                    onPressed: () {
                      context.read<GameCubit>().restart();
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                )
              ],
            ),
          );
        });
  }
}
