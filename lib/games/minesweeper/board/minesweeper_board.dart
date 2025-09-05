import 'package:flutter/material.dart';
import 'package:flutter_games/games/minesweeper/cell/cell.dart';
import 'package:flutter_games/games/minesweeper/cell/cell_state/minesweeper_cell_state.dart';
import 'package:flutter_games/games/minesweeper/cell/neighbor_cells/neighbor_cells.dart';
import 'package:flutter_games/games/minesweeper/face/face.dart';

class MinesweeperBoard extends StatelessWidget {
  const MinesweeperBoard({
    required this.boardState,
    required this.gameState,
    required this.cellSize,
    required this.isHorizontalView,
    required this.onGetNeighborCells,
    required this.onUpdateCellState,
    required this.onClearSurroundingCells,
    super.key,
  });

  final List<List<MinesweeperCellState>> boardState;
  final GameState gameState;
  final double cellSize;
  final bool isHorizontalView;
  final NeighborCells Function(MinesweeperCellState state) onGetNeighborCells;
  final void Function(MinesweeperCellState state) onUpdateCellState;
  final void Function(MinesweeperCellState state) onClearSurroundingCells;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: isHorizontalView ? Axis.horizontal : Axis.vertical,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        boardState.length,
        (x) {
          return Container(
            color: Colors.black,
            child: Flex(
              direction: isHorizontalView ? Axis.vertical : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                boardState[x].length,
                (y) {
                  final cellState = boardState[x][y];
                  return Cell(
                    cellSize: cellSize,
                    state: cellState,
                    gameState: gameState,
                    neighborCells: onGetNeighborCells(cellState),
                    onChangeState: onUpdateCellState,
                    onClearSurroundingCells: onClearSurroundingCells,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
