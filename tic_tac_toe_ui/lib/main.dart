import 'package:flutter/material.dart';
import 'package:tic_tac_toe_ui/models/meniu_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: StrategyPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final Meniu homePageMeniu = Meniu.homePage();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 163, 240, 210),
      body: homePageMeniu.getMeniu(context),
    );
  }
}

class StrategyPage extends StatelessWidget {
  StrategyPage({super.key});
  final Meniu strategyMeniu = Meniu.strategyPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 163, 240, 210),
      body: strategyMeniu.getMeniu(context),
    );
  }
}

class _GamePagState extends StatefulWidget {
  const _GamePagState({super.key});

  @override
  State<_GamePagState> createState() => __GamePagStateState();
}

class __GamePagStateState extends State<_GamePagState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          children: [
            for(var index = 0; index<0;index++)
          ],
        ),
      ),
    );
  }
}
