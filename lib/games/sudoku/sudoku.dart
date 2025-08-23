import 'package:flutter/material.dart';
import 'package:flutter_games/games/sudoku/board/sudoku_board.dart';
import 'package:flutter_games/games/sudoku/sudoku_controller.dart';

class Sudoku extends StatefulWidget {
  const Sudoku({super.key});

  @override
  State<Sudoku> createState() => _SudokuState();
}

class _SudokuState extends State<Sudoku> {
  final ctrl = SudokuController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SudokuBoard(),
          ],
        )
      ],
    );
  }
}
