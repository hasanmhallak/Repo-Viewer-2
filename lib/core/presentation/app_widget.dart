import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repo_viewer/auth/application/auth_state.dart';
import 'package:repo_viewer/auth/providers/providers.dart';

import 'routes.dart' as route;

class AppWidget extends ConsumerWidget {
  const AppWidget();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthState>(authNotifier, (previous, state) {
      state.maybeWhen(
        orElse: () {},
        authenticated: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            route.starredReposPage,
            (route) => false,
          );
        },
        unauthenticated: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            route.signinPage,
            (route) => false,
          );
        },
      );
    });
    return MaterialApp(
      title: 'Repo Viewer',
      darkTheme: ThemeData.dark(),
      initialRoute: route.splashScreen,
      onGenerateRoute: route.controller,
    );
  }
}
