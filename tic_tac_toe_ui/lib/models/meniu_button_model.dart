import 'package:flutter/material.dart';

class MeniuButton {
  String name;
  Icon icon;

  MeniuButton({required this.name, this.icon = const Icon(Icons.arrow_right_rounded)});

  static List<MeniuButton> getStrategyButtons() {
    List<MeniuButton> buttons = [];

    buttons.add(MeniuButton(name: 'Easy'));
    buttons.add(MeniuButton(name: 'Medium'));
    buttons.add(MeniuButton(name: 'Hard'));

    return buttons;
  }

  static List<MeniuButton> getHomeButtons() {
    List<MeniuButton> buttons = [];

    buttons.add(MeniuButton(name: 'Single Player', icon: const Icon(Icons.person)));
    buttons.add(MeniuButton(name: 'Multiplayer', icon: const Icon(Icons.people)));

    return buttons;
  }

  ElevatedButton getButton() {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 2),
            Text(
              name,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.left,
            ),
          ],
        ));
  }
}
