// Routes names.
import 'package:flutter/material.dart';
import 'package:repo_viewer/auth/infrastructure/type_defs/type_defs.dart';
import 'package:repo_viewer/auth/presentation/auth_page.dart';
import 'package:repo_viewer/auth/presentation/sign_in_page.dart';
import 'package:repo_viewer/core/presentation/app_widget.dart';
import 'package:repo_viewer/core/presentation/splash_screen.dart';

const splashScreen = '/splash_screen';
const appWidget = '/app_widget';
const signinPage = '/signin';
const authorizationPage = '/authorization';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case splashScreen:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case appWidget:
      return MaterialPageRoute(builder: (context) => const AppWidget());
    case signinPage:
      return MaterialPageRoute(builder: (context) => const SignInPage());
    case authorizationPage:
      return MaterialPageRoute(
        builder: (context) {
          final args = settings.arguments! as Map<String, dynamic>;
          return AuthPage(
            authorizedUrlHandler: args['authorizedUrlHandler'] as AuthHandler,
            initialUrl: args['initialUrl'] as String,
          );
        },
      );
    default:
      throw 'This route name does not exit';
  }
}
