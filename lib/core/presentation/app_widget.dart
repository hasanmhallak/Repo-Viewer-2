import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repo_viewer/auth/application/auth_state.dart';
import 'package:repo_viewer/auth/presentation/landing_page.dart';
import 'package:repo_viewer/auth/presentation/sign_in_page.dart';
import 'package:repo_viewer/auth/providers/providers.dart';
import 'package:repo_viewer/repos/starred_repo/presentation/starred_repos_page.dart';
import 'package:sizer/sizer.dart';

import 'splash_screen.dart';

class AppWidget extends ConsumerWidget {
  const AppWidget();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.read(authNotifier.notifier).checkAndUpdateAuthState();
    // ref.listen<AuthState>(authNotifier, (previous, next) {
    //   next.maybeWhen(
    //     orElse: () {
    //       print('orElse');
    //     },
    //     authenticated: () {
    //       Navigator.of(context).pushNamedAndRemoveUntil(
    //         '/starred_paged',
    //         (route) => false,
    //       );
    //     },
    //     unauthenticated: () {
    //       print('lol');
    //       Navigator.of(context).pushNamedAndRemoveUntil(
    //         '/signin_page',
    //         (route) => false,
    //       );
    //     },
    //   );
    // });
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          title: 'Repo Viewer',
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
          ),
          initialRoute: '/landing_page',
          routes: {
            '/landing_page': (context) => const LandingPage(),
            '/splash_screen': (context) => const SplashScreen(),
            '/signin_page': (context) => const SignInPage(),
            '/starred_page': (context) => const StarredReposPage(),
          },
        );
      },
    );
  }
}

/* 
 ref.read(authNotifier.notifier).checkAndUpdateAuthState();
                ref.listen<AuthState>(authNotifier, (previous, next) {
                  next.maybeWhen(
                    orElse: () {
                      print('orElse');
                    },
                    authenticated: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const StarredReposPage(),
                        ),
                      );
                    },
                    unauthenticated: () {
                      print('lol');
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                      );
                    },
                  );
                });
*/



/* 
state.when(
            initial: () => const SplashScreen(),
            unauthenticated: () => const SignInPage(),
            authenticated: () {
              Navigator.pop(context);
              return const StarredReposPage();
            },
            failure: (failure) => null,
          ),
        );
*/


/*
ProviderListener<AuthState>(
            provider: authNotifier,
            onChange: (context, lol, next) {
              next.maybeWhen(
                orElse: () {
                  print('orElse');
                },
                authenticated: () {
                  print('authenticated');

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const StarredReposPage(),
                    ),
                  );
                },
                unauthenticated: () {
                  print('unauthenticated');
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SignInPage(),
                    ),
                  );
                },
              );
              // return SplashScreen();
            },
            child: SplashScreen(),
          )
 */
