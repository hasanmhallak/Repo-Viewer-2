import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../auth/presentation/auth_page.dart';
import '../../../auth/presentation/sign_in_page.dart';
import '../../../repos/starred_repo/presentation/starred_repos_page.dart';
import '../../../auth/presentation/splash_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: SignInPage, path: '/signin'),
    AutoRoute(page: AuthPage, path: '/authpage'),
    AutoRoute(page: StarredReposPage, path: '/starred'),
  ],
)
class AppRouter extends _$AppRouter {}
