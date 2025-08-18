import 'package:flutter/material.dart';
import 'package:flutter_games/games/minesweeper/cell/cell_shell/cell_shell.dart';
import 'package:flutter_games/games/minesweeper/cell/cell_state/cell_state.dart';
import 'package:flutter_games/games/minesweeper/cell/neighbor_cells/neighbor_cells.dart';

class ClearedCell extends StatelessWidget {
  const ClearedCell({
    required this.state,
    required this.neighborCells,
    required this.onClearSurroundingCells,
    required this.cellSize,
    required this.showHover,
    super.key,
  });

  final double cellSize;
  final CellState state;
  final NeighborCells neighborCells;
  final void Function(CellState) onClearSurroundingCells;
  final bool showHover;

  @override
  Widget build(BuildContext context) {
    return CellShell(
      state: state,
      size: cellSize,
      bombNumber: neighborCells.bombNumber,
      bombNumberColor: neighborCells.bombNumberColor,
      onLeftClick: neighborCells.bombNumber > 0
          ? () => onClearSurroundingCells(state)
          : null,
      color: Colors.grey,
      showHover: showHover,
    );
  }
}
