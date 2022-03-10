import 'package:flutter/material.dart';
import 'package:repo_viewer/repos/starred_repo/bloc/starred_state.dart';
import 'package:repo_viewer/repos/starred_repo/presentation/failure_repo_tile.dart';
import 'package:repo_viewer/repos/starred_repo/presentation/repo_tile.dart';

import 'loading_tile.dart';

class PaginatedReposListView extends StatefulWidget {
  final StarredState state;
  const PaginatedReposListView(this.state, {Key? key}) : super(key: key);

  @override
  State<PaginatedReposListView> createState() => _PaginatedReposListViewState();
}

class _PaginatedReposListViewState extends State<PaginatedReposListView> {
  int getItemCount(StarredState state) {
    return state.when(
      initial: (freshRepos) => 0,
      loading: (freshRepos, itemsPerPage) =>
          freshRepos.data.length + itemsPerPage,
      loaded: (freshRepos) => freshRepos.data.length,
      failure: (_, freshRepos) => freshRepos.data.length + 1,
    );
  }

  Widget getItemBuilder(BuildContext context, int index, StarredState state) {
    return state.when(
      initial: (freshRepos) => Container(),
      loading: (freshRepos, _) {
        if (index < freshRepos.data.length) {
          return RepoTile(freshRepos.data[index]);
        } else {
          return const LoadingTile();
        }
      },
      loaded: (freshRepos) {
        return RepoTile(freshRepos.data[index]);
      },
      failure: (failure, freshRepos) {
        if (index < freshRepos.data.length) {
          return RepoTile(freshRepos.data[index]);
        } else {
          return FailureRepoTile(failure);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: getItemCount(widget.state),
      itemBuilder: (context, index) =>
          getItemBuilder(context, index, widget.state),
    );
  }
}
