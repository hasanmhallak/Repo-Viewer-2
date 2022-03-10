import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../bloc/starred_bloc.dart';
import '../providers/provider.dart';
import 'no_result_dispaly.dart';
import 'paginated_repos_listview.dart';

class StarredReposPage extends ConsumerWidget {
  final Future<void> Function() signout;
  const StarredReposPage(this.signout, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Repo Viewer'),
        actions: [
          IconButton(
            onPressed: () async {
              return signout();
            },
            icon: const Icon(MdiIcons.logout),
          ),
        ],
      ),
      body: BlocProvider<StarredBloc>(
        create: (context) => StarredBloc(ref.watch(starredRepositoryProvider)),
        child: const PaginatedRepos(),
      ),
    );
  }
}

class PaginatedRepos extends StatefulWidget {
  const PaginatedRepos({Key? key}) : super(key: key);

  @override
  _PaginatedReposState createState() => _PaginatedReposState();
}

class _PaginatedReposState extends State<PaginatedRepos> {
  bool _canLoadNextPage = false;
  bool hasAlreadyShownToast = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      return context.read<StarredBloc>().add(const StarredEvent.getNextPage());
    });
  }

  bool handelScrollNotifications(ScrollNotification notification) {
    final metrics = notification.metrics;
    // limits = maxListLength - theLengthShownOnScreen / 3
    final limits = metrics.maxScrollExtent - metrics.viewportDimension / 3;

    if (metrics.pixels >= limits && _canLoadNextPage) {
      context.read<StarredBloc>().add(const StarredEvent.getNextPage());
    }

    // TODO: try to return false.
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: handelScrollNotifications,
      child: BlocConsumer<StarredBloc, StarredState>(
        listener: (context, state) {
          // TODO: implement toasts.
          state.map(
            initial: (_) => _canLoadNextPage = false,
            loading: (_) => _canLoadNextPage = false,
            loaded: (_) {
              if (!_.freshRepos.isFresh && !hasAlreadyShownToast) {
                hasAlreadyShownToast = true;
                context.showToast(
                  "You're not online. some information may be outdated.",
                );
              }
              return _canLoadNextPage = _.freshRepos.isNextPageAvailable;
            },
            failure: (_) => _canLoadNextPage = _.freshRepos.isNextPageAvailable,
          );
        },
        builder: (context, state) {
          return state.maybeMap(
            orElse: () => false,
            loaded: (_) => _.freshRepos.data.isEmpty,
          )
              ? const NoResultDisplay()
              : PaginatedReposListView(state);
        },
      ),
    );
  }
}
