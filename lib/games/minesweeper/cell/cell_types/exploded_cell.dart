import 'package:flutter/material.dart';
import 'package:flutter_games/games/minesweeper/cell/cell_shell/cell_shell.dart';
import 'package:flutter_games/games/minesweeper/cell/cell_state/minesweeper_cell_state.dart';

class ExplodedCell extends StatelessWidget {
  const ExplodedCell({
    required this.state,
    required this.onChangeState,
    required this.cellSize,
    super.key,
  });

  final double cellSize;
  final MinesweeperCellState state;
  final void Function(MinesweeperCellState) onChangeState;

  @override
  Widget build(BuildContext context) {
    return CellShell(
      state: state,
      size: cellSize,
      image: Image.asset('assets/images/bomb.png'),
      color: Colors.red,
    );
  }
}
