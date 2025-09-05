// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sudoku_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SudokuController on _SudokuControllerBase, Store {
  Computed<SudokuBoardState?>? _$boardStateComputed;

  @override
  SudokuBoardState? get boardState => (_$boardStateComputed ??=
          Computed<SudokuBoardState?>(() => super.boardState,
              name: '_SudokuControllerBase.boardState'))
      .value;

  late final _$_boardStateAtom =
      Atom(name: '_SudokuControllerBase._boardState', context: context);

  @override
  SudokuBoardState? get _boardState {
    _$_boardStateAtom.reportRead();
    return super._boardState;
  }

  @override
  set _boardState(SudokuBoardState? value) {
    _$_boardStateAtom.reportWrite(value, super._boardState, () {
      super._boardState = value;
    });
  }

  late final _$_SudokuControllerBaseActionController =
      ActionController(name: '_SudokuControllerBase', context: context);

  @override
  SudokuBoardState? setBoardState(SudokuBoardState? value) {
    final _$actionInfo = _$_SudokuControllerBaseActionController.startAction(
        name: '_SudokuControllerBase.setBoardState');
    try {
      return super.setBoardState(value);
    } finally {
      _$_SudokuControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
boardState: ${boardState}
    ''';
  }
}
