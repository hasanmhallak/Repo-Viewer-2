import 'package:bloc/bloc.dart';
import 'package:repo_viewer/repos/core/domain/fresh.dart';
import 'package:repo_viewer/repos/starred_repo/domain/repo.dart';
import 'package:repo_viewer/repos/starred_repo/domain/starred_repository.dart';

import 'starred_event.dart';
import 'starred_state.dart';

export 'package:bloc/bloc.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

export 'starred_event.dart';
export 'starred_state.dart';

class StarredBloc extends Bloc<StarredEvent, StarredState> {
  final StarredRepository _repository;
  int _page = 1;
  StarredBloc(this._repository) : super(StarredState.initial(Fresh.no([]))) {
    on<StarredEvent>((event, emit) {
      _getNextPage(_page, emit);
    });
  }

  Future _getNextPage(int page, Emitter<StarredState> emit) async {
    emit(StarredState.loading(state.freshRepos));
    final failureOrSuccess = await _repository.getStarredReposPage(page);
    emit(
      failureOrSuccess.fold(
        (failure) {
          return StarredState.failure(
            failure,
            state.freshRepos,
          );
        },
        (freshRepos) {
          if (freshRepos.isNextPageAvailable) _page++;
          final newFreshRepos = addNewReposToOldReposList(freshRepos);
          return StarredState.loaded(newFreshRepos);
        },
      ),
    );
  }

  // Keeps Old repos when scrolling and add the new loaded data.
  Fresh<List<Repo>> addNewReposToOldReposList(Fresh<List<Repo>> freshRepos) {
    return freshRepos.copyWith(
      data: [
        ...state.freshRepos.data,
        ...freshRepos.data,
      ],
    );
  }
}
