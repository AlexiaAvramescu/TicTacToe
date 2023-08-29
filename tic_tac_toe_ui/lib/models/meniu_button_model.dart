import 'package:flutter/material.dart';

class MeniuButton {
  String name;
  Icon? icon;

  MeniuButton({required this.name, this.icon});

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

  Container getButton() {
    return Container();
  }
}
