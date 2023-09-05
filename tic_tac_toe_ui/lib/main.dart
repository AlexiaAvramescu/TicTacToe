import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe_ui/cubit/game_cubit.dart';
import 'package:tic_tac_toe_ui/lifecycle_event_handler.dart';
import 'package:tic_tac_toe_ui/pages/home_page.dart';
import 'package:logger/logger.dart';

void main() {
  // Disable log messages
  Logger.level = Level.off;

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameCubit(),
      child: Builder(builder: (context) {
        WidgetsBinding.instance.addObserver(LifecycleEventHandler(resumeCallBack: () async {
          context.read<GameCubit>().resumeTimer();
        }, suspendingCallBack: () async {
          context.read<GameCubit>().pauseTimer();
        }));
        return const MaterialApp(
          title: 'TicTacToe',
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        );
      }),
    );
  }
}
