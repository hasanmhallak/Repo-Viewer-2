// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

import '../infrastructure/repo_dto.dart';

part 'repo.freezed.dart';

@freezed
class Repo with _$Repo {
  const Repo._();
  const factory Repo({
    required int index,
    required int id,
    required String name,
    required String description,
    required int starCount,
    required String avatarUrl,
  }) = _Repo;

  factory Repo.fromDTO(RepoDTO _) {
    return Repo(
      index: _.index,
      id: _.id,
      name: _.name,
      description: _.description,
      starCount: _.starCount,
      avatarUrl: _.avatarUrl,
    );
  }
}

extension RepoDTOListToRepoList on List<RepoDTO> {
  /// Shortcut to convert a `List<RepoDTO>` to `List<Repo>`.
  List<Repo> toDomain() {
    return map((e) => Repo.fromDTO(e)).toList();
  }
}
