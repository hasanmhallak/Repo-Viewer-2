import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/fresh.dart';
import '../../core/domain/repo_failure.dart';
import '../domain/repo.dart';

part 'starred_state.freezed.dart';

@freezed
class StarredState with _$StarredState {
  const StarredState._();
  const factory StarredState.initial(Fresh<List<Repo>> freshRepos) = _Initial;
  const factory StarredState.loading(Fresh<List<Repo>> freshRepos) = _Loading;
  const factory StarredState.loaded(
    Fresh<List<Repo>> freshRepos,
  ) = _Loaded;
  const factory StarredState.failure(
    RepoFailure failure,
    Fresh<List<Repo>> freshRepos,
  ) = _Failure;
}
