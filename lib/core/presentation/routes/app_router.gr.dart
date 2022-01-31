// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

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
      final args = routeData.argsAs<StarredReposRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: StarredReposPage(args.signout, key: args.key));
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

/// generated route for [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute() : super(name, path: '/signin');

  static const String name = 'SignInRoute';
}

/// generated route for [AuthPage]
class AuthRoute extends PageRouteInfo<AuthRouteArgs> {
  AuthRoute(
      {Key? key,
      required String initialUrl,
      required dynamic Function(Uri) authorizedUrlHandler})
      : super(name,
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

/// generated route for [StarredReposPage]
class StarredReposRoute extends PageRouteInfo<StarredReposRouteArgs> {
  StarredReposRoute({required Future<void> Function() signout, Key? key})
      : super(name,
            path: '/starred',
            args: StarredReposRouteArgs(signout: signout, key: key));

  static const String name = 'StarredReposRoute';
}

class StarredReposRouteArgs {
  const StarredReposRouteArgs({required this.signout, this.key});

  final Future<void> Function() signout;

  final Key? key;

  @override
  String toString() {
    return 'StarredReposRouteArgs{signout: $signout, key: $key}';
  }
}
