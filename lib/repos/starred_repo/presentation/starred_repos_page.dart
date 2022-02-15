import 'package:flutter/material.dart';
import '../bloc/starred_bloc.dart';

class StarredReposPage extends StatelessWidget {
  final Future<void> Function() signout;
  const StarredReposPage(this.signout, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: BlocProvider(
        create: (context) => StarredBloc(),
        child: BlocConsumer<StarredEvent, StarredState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return state.when(
              initial: initial,
              loading: loading,
              loaded: loaded,
              failure: failure,
            );
          },
        ),
      ),
    );
  }
}
