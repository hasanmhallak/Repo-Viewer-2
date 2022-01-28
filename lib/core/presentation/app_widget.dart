import 'package:flutter/material.dart';

import 'splash_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Repo Viewer',
      darkTheme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}
