import 'package:flutter/material.dart';
import 'package:flutter_games/core/themes.dart';
import 'package:flutter_games/router/router.dart';
import 'package:universal_html/html.dart' as html;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    html.document.onContextMenu.listen((event) => event.preventDefault());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Games',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: router,
    );
  }
}
