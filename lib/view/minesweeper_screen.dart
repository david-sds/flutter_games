import 'package:flutter/material.dart';
import 'package:flutter_games/games/minesweeper/minesweeper.dart';

class MinesweeperScreen extends StatelessWidget {
  const MinesweeperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Minesweeper'),
      ),
      body: const Minesweeper(
        initialDifficulty: Difficulty.classic,
      ),
    );
  }
}
