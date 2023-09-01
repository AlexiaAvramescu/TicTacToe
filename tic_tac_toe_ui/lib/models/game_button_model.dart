import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';
import 'package:tic_tac_toe_ui/cubit/game_cubit.dart';
import 'package:tic_tac_toe_ui/cubit/game_state.dart';

class GameButton extends StatelessWidget {
  final int index;
  final GameState state;
  const GameButton({super.key, required this.index, required this.state});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 163, 240, 210)),
        ),
        onPressed: () {
          context.read<GameCubit>().makeMove(Position(index ~/ 3, index % 3));
        },
        child: Builder(builder: (context) {
          if (state.board != null) {
            if (state.board![index ~/ 3][index % 3] == EMark.O) {
              return const Text(
                'O',
                style: TextStyle(fontSize: 35, color: Colors.green, fontStyle: FontStyle.normal),
              );
            }
            if (state.board![index ~/ 3][index % 3] == EMark.X) {
              return const Text(
                'X',
                style: TextStyle(fontSize: 35, color: Colors.green, fontStyle: FontStyle.normal),
              );
            }
            return const Text('');
          }
          return const Text('');
        }),
      ),
    );
  }
}
