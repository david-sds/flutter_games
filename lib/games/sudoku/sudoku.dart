import 'package:flutter/material.dart';
import 'package:flutter_games/games/sudoku/sudoku_controller.dart';
import 'package:flutter_games/games/sudoku/ui/sudoku_board.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Sudoku extends StatefulWidget {
  const Sudoku({super.key});

  @override
  State<Sudoku> createState() => _SudokuState();
}

class _SudokuState extends State<Sudoku> {
  final ctrl = SudokuController();

  @override
  void initState() {
    ctrl.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Observer(builder: (context) {
            final boardState = ctrl.boardState;

            if (boardState == null) {
              return Placeholder();
            }

            return SudokuBoard(
              boardState: boardState,
            );
          }),
        )
      ],
    );
  }
}
