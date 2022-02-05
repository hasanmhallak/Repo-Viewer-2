import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../auth/application/auth_state.dart';
import '../../auth/providers/providers.dart';
import '../../repos/core/providers/provider.dart';
import 'routes/app_router.dart';

class AppWidget extends ConsumerWidget {
  final _appRouter = AppRouter();

  void _authenticated(WidgetRef provider) {
    _appRouter.pushAndPopUntil(
      StarredReposRoute(
        signout: provider.read(authNotifier.notifier).signout() as Future<void>
            Function(),
      ),
      predicate: (route) => false,
    );
  }

  void _unauthenticated() {
    _appRouter.pushAndPopUntil(
      const SignInRoute(),
      predicate: (route) => false,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef provider) {
    provider.listen(initializationProvider, (previous, next) {});
    provider.read(authNotifier.notifier).checkAndUpdateAuthState();
    provider.listen<AuthState>(authNotifier, (previous, next) {
      next.maybeWhen(
        orElse: () {},
        authenticated: () => _authenticated(provider),
        unauthenticated: () => _unauthenticated(),
      );
    });

    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          // useInheritedMediaQuery: true,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          title: 'Repo Viewer',
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
          ),
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(),
        );
      },
    );
  }
}
