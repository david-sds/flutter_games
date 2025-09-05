import 'package:flutter_games/core/widgets/layouts/main_layout.dart';
import 'package:flutter_games/games/minesweeper/minesweeper.dart';
import 'package:flutter_games/games/sudoku/sudoku.dart';
import 'package:go_router/go_router.dart';

enum Routes {
  minesweeper(
    path: '/minesweeper',
    name: 'Minesweeper',
  ),
  sudoku(
    path: '/sudoku',
    name: 'Sudoku',
  );

  const Routes({
    required this.path,
    required this.name,
  });

  final String path;
  final String name;
}

final router = GoRouter(
  initialLocation: Routes.sudoku.path,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(
          path: Routes.minesweeper.path,
          name: Routes.minesweeper.name,
          builder: (context, state) {
            return Minesweeper(
              initialDifficulty: Difficulty.classic,
            );
          },
        ),
        GoRoute(
          path: Routes.sudoku.path,
          name: Routes.sudoku.name,
          builder: (context, state) {
            return Sudoku();
          },
        ),
      ],
    ),
  ],
);
