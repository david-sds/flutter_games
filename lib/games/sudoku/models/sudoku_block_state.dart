import 'package:flutter_games/games/sudoku/models/sudoku_cell_state.dart';

class SudokuBlockState {
  SudokuCellState topLeftCell;
  SudokuCellState topCenterCell;
  SudokuCellState topRightCell;
  SudokuCellState middleLeftCell;
  SudokuCellState middleCenterCell;
  SudokuCellState middleRightCell;
  SudokuCellState bottomLeftCell;
  SudokuCellState bottomCenterCell;
  SudokuCellState bottomRightCell;

  SudokuBlockState({
    required this.topLeftCell,
    required this.topCenterCell,
    required this.topRightCell,
    required this.middleLeftCell,
    required this.middleCenterCell,
    required this.middleRightCell,
    required this.bottomLeftCell,
    required this.bottomCenterCell,
    required this.bottomRightCell,
  });

  SudokuBlockState copyWith({
    SudokuCellState? topLeftCell,
    SudokuCellState? topCenterCell,
    SudokuCellState? topRightCell,
    SudokuCellState? middleLeftCell,
    SudokuCellState? middleCenterCell,
    SudokuCellState? middleRightCell,
    SudokuCellState? bottomLeftCell,
    SudokuCellState? bottomCenterCell,
    SudokuCellState? bottomRightCell,
  }) {
    return SudokuBlockState(
      topLeftCell: topLeftCell ?? this.topLeftCell,
      topCenterCell: topCenterCell ?? this.topCenterCell,
      topRightCell: topRightCell ?? this.topRightCell,
      middleLeftCell: middleLeftCell ?? this.middleLeftCell,
      middleCenterCell: middleCenterCell ?? this.middleCenterCell,
      middleRightCell: middleRightCell ?? this.middleRightCell,
      bottomLeftCell: bottomLeftCell ?? this.bottomLeftCell,
      bottomCenterCell: bottomCenterCell ?? this.bottomCenterCell,
      bottomRightCell: bottomRightCell ?? this.bottomRightCell,
    );
  }

  List<List<SudokuCellState>> get matrix => [
        [topLeftCell, topCenterCell, topRightCell],
        [middleLeftCell, middleCenterCell, middleRightCell],
        [bottomLeftCell, bottomCenterCell, bottomRightCell],
      ];

  List<List<SudokuCellState>> get transposedMatrix => [
        for (int i = 0; i < matrix[0].length; i++)
          [for (int j = 0; j < matrix.length; j++) matrix[j][i]]
      ];

  bool vallidate({bool recursive = true}) {
    final cellNumberCounter = List.generate(9, (_) => 0);

    for (final list in matrix) {
      for (final cell in list) {
        if (recursive && !cell.isValid) {
          return false;
        }

        final cellNumber = cell.number;

        if (cellNumber == null) {
          continue;
        }

        cellNumberCounter[cellNumber - 1] += 1;
      }
    }

    if (cellNumberCounter.any((counter) => counter != 1)) {
      return false;
    }

    return true;
  }

  bool canBeSameBand(SudokuBlockState otherBlock) {
    for (int i = 0; i < matrix.length; i++) {
      final blockRow = matrix[i];
      final otherBlockRow = otherBlock.matrix[i];

      for (int j = 0; j < blockRow.length; j++) {
        final blockCellNumber = blockRow[j].number;

        if (blockCellNumber == null) {
          return true;
        }

        final otherBlockRowNumbers = otherBlockRow.map(
          (cell) => cell.number,
        );

        if (otherBlockRowNumbers
                .where((number) => number != blockCellNumber)
                .length !=
            (otherBlockRowNumbers.length - 1)) {
          return false;
        }
      }
    }

    return true;
  }

  bool canBeSameStack(SudokuBlockState otherBlock) {
    for (int i = 0; i < transposedMatrix.length; i++) {
      final blockColumn = transposedMatrix[i];
      final otherBlockColumn = otherBlock.transposedMatrix[i];

      for (int j = 0; j < blockColumn.length; j++) {
        final blockCellNumber = blockColumn[j].number;

        if (blockCellNumber == null) {
          return true;
        }

        final otherBlockColumnNumbers = otherBlockColumn.map(
          (cell) => cell.number,
        );

        if (otherBlockColumnNumbers
                .where((number) => number != blockCellNumber)
                .length !=
            (otherBlockColumnNumbers.length - 1)) {
          return false;
        }
      }
    }

    return true;
  }
}
