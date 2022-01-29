import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'routes.dart' as route;

class AppWidget extends ConsumerWidget {
  const AppWidget();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Repo Viewer',
      darkTheme: ThemeData.dark(),
      initialRoute: route.splashScreen,
      onGenerateRoute: route.controller,
    );
  }
}
