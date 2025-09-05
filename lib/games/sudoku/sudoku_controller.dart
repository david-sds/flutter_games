import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_games/games/sudoku/models/sudoku_block_state.dart';
import 'package:flutter_games/games/sudoku/models/sudoku_board_state.dart';
import 'package:flutter_games/games/sudoku/models/sudoku_cell_state.dart';
import 'package:mobx/mobx.dart';

part 'sudoku_controller.g.dart';

class SudokuController extends _SudokuControllerBase with _$SudokuController {}

abstract class _SudokuControllerBase with Store {
  @observable
  SudokuBoardState? _boardState;
  @computed
  SudokuBoardState? get boardState => _boardState;
  @action
  SudokuBoardState? setBoardState(SudokuBoardState? value) => _boardState;

  SudokuBoardState? generateSudokuBoardState() {
    final boardState = _generateInitialState();

    var count = 0;
    for (final band in boardState.matrix) {
      for (final block in band) {
        final possibleNumbers = List.generate(9, (index) => index + 1);
        for (final row in block.matrix) {
          for (final cell in row) {
            int randomNumber;

            do {
              final Random random = Random();
              final int randomIndex = random.nextInt(possibleNumbers.length);
              randomNumber = possibleNumbers[randomIndex];
              count++;
              print('$count: $randomNumber');
              cell.number = randomNumber;
            } while (!boardState.validate(recursive: false));

            possibleNumbers.remove(randomNumber);
          }
        }
      }
    }

    if (!boardState.validate()) {
      debugPrint('Something went wrong while generating Sudoku\'s board.');
      return null;
    }

    return boardState;
  }

  SudokuBoardState _generateInitialState() {
    SudokuBlockState initialBlockState() => SudokuBlockState(
          topLeftCell: SudokuCellState(),
          topCenterCell: SudokuCellState(),
          topRightCell: SudokuCellState(),
          middleLeftCell: SudokuCellState(),
          middleCenterCell: SudokuCellState(),
          middleRightCell: SudokuCellState(),
          bottomLeftCell: SudokuCellState(),
          bottomCenterCell: SudokuCellState(),
          bottomRightCell: SudokuCellState(),
        );

    final boardState = SudokuBoardState(
      topLeftBlock: initialBlockState(),
      topCenterBlock: initialBlockState(),
      topRightBlock: initialBlockState(),
      middleLeftBlock: initialBlockState(),
      middleCenterBlock: initialBlockState(),
      middleRightBlock: initialBlockState(),
      bottomLeftBlock: initialBlockState(),
      bottomCenterBlock: initialBlockState(),
      bottomRightBlock: initialBlockState(),
    );

    return boardState;
  }

  void init() {
    _boardState = generateSudokuBoardState();
    print(_boardState?.matrix.map((e) =>
        e.map((e2) => e2.matrix.map((e3) => e3.map((e4) => e4.number)))));
  }
}
