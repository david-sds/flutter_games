import 'package:flutter/material.dart';
import 'package:flutter_games/games/sudoku/models/sudoku_board_state.dart';

class SudokuBoard extends StatelessWidget {
  const SudokuBoard({
    required this.boardState,
    super.key,
  });

  final SudokuBoardState boardState;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        boardState.matrix.length,
        (index) {
          final band = boardState.matrix[index];
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              band.length,
              (index) {
                final block = band[index];
                return Padding(
                  padding: EdgeInsetsGeometry.all(4),
                  child: Column(
                    children: List.generate(
                      block.matrix.length,
                      (index) {
                        final row = block.matrix[index];
                        return Row(
                          children: List.generate(
                            block.matrix.length,
                            (index) {
                              final cell = row[index];
                              return Padding(
                                padding: EdgeInsets.all(2),
                                child: Container(
                                  color: Theme.of(context).colorScheme.primary,
                                  height: 40,
                                  width: 40,
                                  child: Center(
                                    child: Text(
                                      cell.number?.toString() ?? '-',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
