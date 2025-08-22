import 'package:flutter_games/view/minesweeper_screen.dart';
import 'package:flutter_games/view/sudoku_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  redirect: (context, state) => '/minesweeper',
  routes: [
    GoRoute(
      path: '/minesweeper',
      builder: (context, state) {
        return MinesweeperScreen();
      },
    ),
    GoRoute(
      path: '/sudoku',
      builder: (context, state) {
        return SudokuScreen();
      },
    ),
  ],
);
