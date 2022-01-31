// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashPage());
    },
    SignInRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SignInPage());
    },
    AuthRoute.name: (routeData) {
      final args = routeData.argsAs<AuthRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: AuthPage(
              key: args.key,
              initialUrl: args.initialUrl,
              authorizedUrlHandler: args.authorizedUrlHandler));
    },
    StarredReposRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const StarredReposPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashRoute.name, path: '/'),
        RouteConfig(SignInRoute.name, path: '/signin'),
        RouteConfig(AuthRoute.name, path: '/authpage'),
        RouteConfig(StarredReposRoute.name, path: '/starred')
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/signin');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<AuthRouteArgs> {
  AuthRoute(
      {Key? key,
      required String initialUrl,
      required dynamic Function(Uri) authorizedUrlHandler})
      : super(AuthRoute.name,
            path: '/authpage',
            args: AuthRouteArgs(
                key: key,
                initialUrl: initialUrl,
                authorizedUrlHandler: authorizedUrlHandler));

  static const String name = 'AuthRoute';
}

class AuthRouteArgs {
  const AuthRouteArgs(
      {this.key, required this.initialUrl, required this.authorizedUrlHandler});

  final Key? key;

  final String initialUrl;

  final dynamic Function(Uri) authorizedUrlHandler;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, initialUrl: $initialUrl, authorizedUrlHandler: $authorizedUrlHandler}';
  }
}

/// generated route for
/// [StarredReposPage]
class StarredReposRoute extends PageRouteInfo<void> {
  const StarredReposRoute() : super(StarredReposRoute.name, path: '/starred');

  static const String name = 'StarredReposRoute';
}
