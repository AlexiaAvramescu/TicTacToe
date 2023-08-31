import 'package:flutter/material.dart';

class MeniuButton extends StatelessWidget {
  final String name;
  final Icon icon;
  final VoidCallback onPressed;

  const MeniuButton(
      {super.key, this.name = '', required this.onPressed, this.icon = const Icon(Icons.arrow_right_rounded)});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
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
