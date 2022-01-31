import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repo_viewer/auth/application/auth_state.dart';
import 'package:repo_viewer/auth/providers/providers.dart';
import 'package:sizer/sizer.dart';

import 'routes/app_router.dart';

class AppWidget extends ConsumerWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(authNotifier.notifier).checkAndUpdateAuthState();

    ref.listen<AuthState>(authNotifier, (previous, next) {
      next.maybeWhen(
        orElse: () {},
        authenticated: () {
          _appRouter.pushAndPopUntil(
            const StarredReposRoute(),
            predicate: (route) => false,
          );
        },
        unauthenticated: () {
          _appRouter.pushAndPopUntil(
            const SignInRoute(),
            predicate: (route) => false,
          );
        },
      );
    });

    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
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
