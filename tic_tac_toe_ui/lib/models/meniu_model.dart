import 'package:flutter/material.dart';
import 'package:tic_tac_toe_ui/models/meniu_button_model.dart';

class Meniu {
  late final String title;
  List<MeniuButton> buttons = [];

  Meniu.homePage() {
    title = 'XO Game';
    buttons = MeniuButton.getHomeButtons();
  }
  Meniu.strategyPage() {
    title = 'Choose game strtegy';
    buttons = MeniuButton.getStrategyButtons();
  }

//or column
  Container getMeniu() {
    return Container();
  }
}
