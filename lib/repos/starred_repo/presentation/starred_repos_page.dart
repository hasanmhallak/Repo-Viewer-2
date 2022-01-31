import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StarredReposPage extends ConsumerWidget {
  final Future<void> Function() signout;
  const StarredReposPage(this.signout, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: ElevatedButton(
          onPressed: () => signout(),
          child: const Text('Signout'),
        ),
      ),
    );
  }
}
