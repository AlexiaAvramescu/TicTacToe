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
    title = 'Dificulty';
    buttons = MeniuButton.getStrategyButtons();
  }

//or column
  ConstrainedBox getMeniu(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40, left: 30, right: 20),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var index = 0; index < buttons.length; index++)
                  Column(
                    children: [
                      Container(
                        width: 200,
                        child: buttons[index].getButton(),
                      ),
                      SizedBox(height: 5),
                    ],
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
