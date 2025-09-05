import 'package:flutter/material.dart';
import 'package:flutter_games/games/minesweeper/cell/cell.dart';
import 'package:flutter_games/games/minesweeper/cell/cell_shell/cell_shell.dart';
import 'package:flutter_games/games/minesweeper/cell/cell_state/minesweeper_cell_state.dart';
import 'package:flutter_games/games/minesweeper/cell/neighbor_cells/neighbor_cells.dart';

class DefaultCell extends StatelessWidget {
  const DefaultCell({
    required this.state,
    required this.neighborCells,
    required this.onChangeState,
    required this.onClearSurroundingCells,
    required this.cellSize,
    super.key,
  });

  final double cellSize;
  final MinesweeperCellState state;
  final NeighborCells neighborCells;
  final void Function(MinesweeperCellState) onChangeState;
  final void Function(MinesweeperCellState) onClearSurroundingCells;

  @override
  Widget build(BuildContext context) {
    return CellShell(
      state: state,
      size: cellSize,
      color: Theme.of(context).colorScheme.primary,
      onLeftClick: () {
        if (state.isBomb) {
          onChangeState(
            state.copyWith(
              type: CellStateTypes.exploded,
            ),
          );
        } else {
          if (neighborCells.bombNumber == 0) {
            onClearSurroundingCells(
              state.copyWith(
                type: CellStateTypes.cleared,
              ),
            );
          } else {
            onChangeState(
              state.copyWith(
                type: CellStateTypes.cleared,
              ),
            );
          }
        }
      },
      onRightClick: () => onChangeState(
        state.copyWith(
          type: CellStateTypes.flag,
        ),
      ),
    );
  }
}
