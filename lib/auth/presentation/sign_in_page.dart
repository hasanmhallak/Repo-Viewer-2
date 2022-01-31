import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../core/presentation/routes/app_router.dart';
import '../providers/providers.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
              'assets/gitlab_icon.svg',
              width: 40.w,
              height: 40.w,
            ),
            SizedBox(height: 3.w),
            Text(
              'Welcome to Repo Viewer',
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 3.w),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                ref.watch(authNotifier.notifier).signin((authUri) {
                  final uri = Completer<Uri>();

                  context.router.push(
                    AuthRoute(
                      initialUrl: authUri.toString(),
                      authorizedUrlHandler: (Uri authorizedUrl) {
                        uri.complete(authorizedUrl);
                      },
                    ),
                  );

                  return uri.future;
                });
              },
              child: const Text('Signin'),
            ),
          ],
        ),
      ),
    );
  }
}
