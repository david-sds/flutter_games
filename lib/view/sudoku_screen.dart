import 'package:flutter/material.dart';
import 'package:flutter_games/games/sudoku/sudoku.dart';

class SudokuScreen extends StatelessWidget {
  const SudokuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Sudoku'),
      ),
      body: const Sudoku(),
    );
  }
}
