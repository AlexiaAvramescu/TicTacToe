import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GameButton extends StatelessWidget {
  final int index;
  const GameButton({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: generateBorder(index),
      ),
      child: TextButton(
        onPressed: () {},
        child: const Text(' '),
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
