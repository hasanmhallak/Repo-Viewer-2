import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repo_viewer/repos/starred_repo/providers/provider.dart';

import '../bloc/starred_bloc.dart';

class StarredReposPage extends ConsumerWidget {
  final Future<void> Function() signout;
  const StarredReposPage(this.signout, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => signout(),
            child: const Text('Signout'),
          ),
        ],
      ),
      body: BlocProvider<StarredBloc>(
        create: (context) => StarredBloc(ref.watch(starredRepositoryProvider)),
        child: BlocConsumer<StarredBloc, StarredState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return state.when(
              initial: (freshRepos) => Container(),
              loading: (freshRepos) => Container(),
              loaded: (freshRepos) => Container(),
              failure: (failure, freshRepos) => Container(),
            );
          },
        ),
      ),
    );
  }
}
