import 'package:flutter/material.dart';
import 'package:tic_tac_toe_ui/models/game_button_model.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 163, 240, 210),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              width: 200,
              height: 50,
              child: Text(
                "Who's turn is it.",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              width: 300,
              height: 400,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return GameButton(index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
