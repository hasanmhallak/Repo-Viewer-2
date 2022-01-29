import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repo_viewer/auth/providers/providers.dart';

class StarredReposPage extends ConsumerWidget {
  const StarredReposPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: ElevatedButton(
          child: const Text('Signout'),
          onPressed: () {
            ref.read(authNotifier.notifier).signout();
          },
        ),
      ),
    );
  }
}
