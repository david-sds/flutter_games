import 'package:mobx/mobx.dart';

part 'sudoku_controller.g.dart';

class SudokuController extends _SudokuControllerBase with _$SudokuController {}

abstract class _SudokuControllerBase with Store {}
