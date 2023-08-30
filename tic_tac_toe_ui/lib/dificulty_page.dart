import 'package:flutter/material.dart';
import 'package:tic_tac_toe_ui/game_page.dart';
import 'package:tic_tac_toe_ui/models/meniu_button_model.dart';

class DificultyPage extends StatelessWidget {
  const DificultyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 163, 240, 210),
      body: Center(
        child: SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40, left: 30, right: 20),
                  child: const Text(
                    'Dificulty',
                    style: TextStyle(
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
                    MeniuButton(
                      name: 'Hard',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const GamePage()));
                      },
                    ),
                    MeniuButton(
                      name: 'Medium',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const GamePage()));
                      },
                    ),
                    MeniuButton(
                      name: 'Easy',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const GamePage()));
                      },
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
