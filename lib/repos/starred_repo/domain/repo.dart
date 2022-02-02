// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'repo.freezed.dart';

@freezed
class Repo with _$Repo {
  const Repo._();
  const factory Repo({
    required int order,
    required int id,
    required String name,
    required String description,
    required int starCount,
    required String avatarUrl,
  }) = _Repo;
}
