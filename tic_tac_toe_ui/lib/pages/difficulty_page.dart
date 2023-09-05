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
            width: 250,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _text(),
                const SizedBox(height: 40),
                _buttons(context),
              ],
            )),
      ),
    );
  }

  Widget createMenuButton(BuildContext context, EStrategy strategy) {
    return MeniuButton(
        name: strategy.toString(),
        onPressed: () {
          context.read<GameCubit>().restart();
          context.read<GameCubit>().strategy = strategy;
          Navigator.push(context, MaterialPageRoute(builder: (context) => const GamePage()));
        });
  }

  Column _buttons(BuildContext context) {
    return Column(
      children: [
        createMenuButton(context, EStrategy.hard),
        const SizedBox(height: 20),
        createMenuButton(context, EStrategy.medium),
        const SizedBox(height: 20),
        createMenuButton(context, EStrategy.easy),
        const SizedBox(height: 60),
      ],
    );
  }

  Container _text() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 30, right: 20),
      child: const Text(
        'Difficulty',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
