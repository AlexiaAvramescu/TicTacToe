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
    return Container(
      decoration: BoxDecoration(
        border: generateBorder(index),
      ),
      child: TextButton(
        onPressed: () {
          context.read<GameCubit>().makeMove(Position(index ~/ 3, index % 3));
        },
        child: Builder(
          builder: (context) {
            if (state.board != null) {
              if (state.board![index ~/ 3][index % 3] == EMark.O) {
                return const Text(
                  'O',
                  style: TextStyle(fontSize: 25, color: Colors.green, fontStyle: FontStyle.normal),
                );
              }
              if (state.board![index ~/ 3][index % 3] == EMark.X) {
                return const Text(
                  'X',
                  style: TextStyle(fontSize: 25, color: Colors.green, fontStyle: FontStyle.normal),
                );
              }
            }
            return const Text('');
          },
        ),
      ),
    );
  }

  Border generateBorder(int index) {
    BorderSide bordSide = const BorderSide(color: Colors.black, width: 3);
    switch (index) {
      case 0:
        return Border(right: bordSide, bottom: bordSide);
      case 1:
        return Border(left: bordSide, bottom: bordSide, right: bordSide);
      case 2:
        return Border(left: bordSide, bottom: bordSide);
      case 3:
        return Border(right: bordSide, bottom: bordSide, top: bordSide);
      case 5:
        return Border(left: bordSide, bottom: bordSide, top: bordSide);
      case 6:
        return Border(right: bordSide, top: bordSide);
      case 7:
        return Border(left: bordSide, right: bordSide, top: bordSide);
      case 8:
        return Border(left: bordSide, top: bordSide);
      default:
        return Border(left: bordSide, bottom: bordSide, right: bordSide, top: bordSide);
    }
  }
}
