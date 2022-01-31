import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../core/presentation/splash_page.dart';
// import '../../repos/starred_repo/presentation/starred_repos_page.dart';
// import '../providers/providers.dart';
import 'sign_in_page.dart';

class LandingPage extends ConsumerWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.read(authNotifier.notifier).checkAndUpdateAuthState();
    // final state = ref.watch(authNotifier);
    // return state.maybeWhen(
    //   orElse: () {
    //     Future.microtask(
    //       () => Navigator.of(context).popUntil(
    //         (route) => route.settings.name == '/landing_page',
    //       ),
    //     );
    //     return const SplashPage();
    //   },
    //   authenticated: () {
    //     Future.microtask(
    //       () => Navigator.of(context).popUntil(
    //         (route) => route.settings.name == '/landing_page',
    //       ),
    //     );
    //     return const StarredReposPage();
    //   },
    //   unauthenticated: () {
    //     Future.microtask(
    //       () => Navigator.of(context).popUntil(
    //         (route) => route.settings.name == '/landing_page',
    //       ),
    //     );
    //     return const SignInPage();
    //   },
    // );
    return const SignInPage();
  }
}
