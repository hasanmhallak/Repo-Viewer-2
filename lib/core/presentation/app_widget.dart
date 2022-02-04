import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../auth/application/auth_state.dart';
import '../../auth/providers/providers.dart';
import 'routes/app_router.dart';

// [FutureProvider] are used when some data need to be async.
final initializationProvider = FutureProvider((ref) async {});

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
            StarredReposRoute(
              signout: ref.read(authNotifier.notifier).signout() as Future<void>
                  Function(),
            ),
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
