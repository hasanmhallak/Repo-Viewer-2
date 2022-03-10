import 'package:flutter/material.dart';
import 'package:repo_viewer/repos/starred_repo/bloc/starred_bloc.dart';

import '../../core/domain/repo_failure.dart';

class FailureRepoTile extends StatelessWidget {
  final RepoFailure failure;
  const FailureRepoTile(this.failure, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      textColor: Theme.of(context).colorScheme.onError,
      iconColor: Theme.of(context).colorScheme.onError,
      child: Card(
        color: Theme.of(context).errorColor,
        child: ListTile(
          leading: const Icon(Icons.warning_amber_rounded),
          title: const Text('An error accrued.'),
          subtitle: Text('${failure.code}: ${failure.message}'),
          trailing: IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<StarredBloc>().add(const StarredEvent.retry());
            },
          ),
        ),
      ),
    );
  }
}
