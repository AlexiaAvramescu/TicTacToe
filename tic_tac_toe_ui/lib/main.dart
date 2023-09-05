import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe_ui/cubit/game_cubit.dart';
import 'package:tic_tac_toe_ui/pages/home_page.dart';
import 'package:logger/logger.dart';

void main() {
  // Disable log messages
  Logger.level = Level.off;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameCubit(),
      child: const MaterialApp(
        title: 'TicTacToe',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
