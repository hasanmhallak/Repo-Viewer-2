import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/fresh.dart';
import '../../core/domain/repo_failure.dart';
import '../domain/repo.dart';

part 'starred_state.freezed.dart';

@freezed
class StarredState with _$StarredState {
  const StarredState._();
  const factory StarredState.initial() = _Initial;
  const factory StarredState.loading() = _Loading;
  const factory StarredState.loaded(
    Fresh<List<Repo>> repos,
  ) = _Loaded;
  const factory StarredState.failure(
    RepoFailure failure,
    Fresh<List<Repo>> repos,
  ) = _Failure;
}
