// ignore_for_file: depend_on_referenced_packages
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../domain/repo.dart';

part 'repo_dto.freezed.dart';
part 'repo_dto.g.dart';

@freezed
class RepoDTO with _$RepoDTO {
  const RepoDTO._();
  const factory RepoDTO({
    required int index,
    required int id,
    required String name,
    required String description,
    @JsonKey(name: 'star_count') required int starCount,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
  }) = _RepoDTO;

  factory RepoDTO.fromJson(Map<String, dynamic> json) =>
      _$RepoDTOFromJson(json);

  factory RepoDTO.fromDomain(Repo _) {
    return RepoDTO(
      index: _.index,
      id: _.id,
      name: _.name,
      description: _.description,
      starCount: _.starCount,
      avatarUrl: _.avatarUrl,
    );
  }
}
