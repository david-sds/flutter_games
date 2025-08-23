import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_games/core/router/router.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    required this.child,
    super.key,
  });

  final Widget? child;

  Routes? getRoutePath(BuildContext context) {
    final String routePath =
        GoRouter.of(context).routeInformationProvider.value.uri.toString();
    return Routes.values.firstWhereOrNull((e) => e.path == routePath);
  }

  void handleRouteChange(BuildContext context, Routes route) {
    GoRouter.of(context).pushNamed(route.name);
    Scaffold.of(context).closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final route = getRoutePath(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Games - ${route?.name}'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: Builder(builder: (context) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                child: Text('Games'),
              ),
              ListTile(
                title: const Text('Minesweeper'),
                onTap: () {
                  handleRouteChange(context, Routes.minesweeper);
                },
              ),
              ListTile(
                title: const Text('Sudoku'),
                onTap: () {
                  handleRouteChange(context, Routes.sudoku);
                },
              ),
            ],
          );
        }),
      ),
      body: child,
    );
  }
}
