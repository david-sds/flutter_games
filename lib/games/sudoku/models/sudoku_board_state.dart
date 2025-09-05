import 'package:flutter_games/games/sudoku/models/sudoku_block_state.dart';

class SudokuBoardState {
  SudokuBlockState topLeftBlock;
  SudokuBlockState topCenterBlock;
  SudokuBlockState topRightBlock;
  SudokuBlockState middleLeftBlock;
  SudokuBlockState middleCenterBlock;
  SudokuBlockState middleRightBlock;
  SudokuBlockState bottomLeftBlock;
  SudokuBlockState bottomCenterBlock;
  SudokuBlockState bottomRightBlock;

  SudokuBoardState({
    required this.topLeftBlock,
    required this.topCenterBlock,
    required this.topRightBlock,
    required this.middleLeftBlock,
    required this.middleCenterBlock,
    required this.middleRightBlock,
    required this.bottomLeftBlock,
    required this.bottomCenterBlock,
    required this.bottomRightBlock,
  });

  SudokuBoardState copyWith({
    SudokuBlockState? topLeftBlock,
    SudokuBlockState? topCenterBlock,
    SudokuBlockState? topRightBlock,
    SudokuBlockState? middleLeftBlock,
    SudokuBlockState? middleCenterBlock,
    SudokuBlockState? middleRightBlock,
    SudokuBlockState? bottomLeftBlock,
    SudokuBlockState? bottomCenterBlock,
    SudokuBlockState? bottomRightBlock,
  }) {
    return SudokuBoardState(
      topLeftBlock: topLeftBlock ?? this.topLeftBlock,
      topCenterBlock: topCenterBlock ?? this.topCenterBlock,
      topRightBlock: topRightBlock ?? this.topRightBlock,
      middleLeftBlock: middleLeftBlock ?? this.middleLeftBlock,
      middleCenterBlock: middleCenterBlock ?? this.middleCenterBlock,
      middleRightBlock: middleRightBlock ?? this.middleRightBlock,
      bottomLeftBlock: bottomLeftBlock ?? this.bottomLeftBlock,
      bottomCenterBlock: bottomCenterBlock ?? this.bottomCenterBlock,
      bottomRightBlock: bottomRightBlock ?? this.bottomRightBlock,
    );
  }

  List<List<SudokuBlockState>> get matrix => [
        [topLeftBlock, topCenterBlock, topRightBlock],
        [middleLeftBlock, middleCenterBlock, middleRightBlock],
        [bottomLeftBlock, bottomCenterBlock, bottomRightBlock],
      ];

  List<List<SudokuBlockState>> get transposedMatrix => [
        for (int i = 0; i < matrix[0].length; i++)
          [for (int j = 0; j < matrix.length; j++) matrix[j][i]]
      ];

  bool validate({bool recursive = true}) {
    for (int i = 0; i < matrix.length; i++) {
      final blockBand = matrix[i];

      for (int j = 0; j < blockBand.length; j++) {
        final blockStack = transposedMatrix[i];
        final block = blockBand[j];

        if (recursive && !block.vallidate(recursive: recursive)) {
          return false;
        }

        final isBlockBandValid = blockBand
                .map((b) => b.canBeSameBand(block))
                .where((isValid) => !isValid)
                .length <=
            1;
        final isBlockStackValid = blockStack
                .map((b) => b.canBeSameStack(block))
                .where((isValid) => !isValid)
                .length <=
            1;
        if (!isBlockBandValid || !isBlockStackValid) {
          return false;
        }
      }
    }

    return true;
  }
}
