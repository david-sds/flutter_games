import 'package:flutter_games/games/minesweeper/cell/cell.dart';

class MinesweeperCellState {
  MinesweeperCellState({
    required this.x,
    required this.y,
    required this.isBomb,
    required this.type,
  });

  int x;
  int y;
  bool isBomb;
  CellStateTypes type;

  MinesweeperCellState copyWith({
    int? x,
    int? y,
    bool? isBomb,
    CellStateTypes? type,
  }) {
    return MinesweeperCellState(
      x: x ?? this.x,
      y: y ?? this.y,
      isBomb: isBomb ?? this.isBomb,
      type: type ?? this.type,
    );
  }

  @override
  String toString() {
    return '\n($x, '
        '$y, '
        'isBomb: $isBomb, '
        'type: ${type.toString()}.)';
  }
}
