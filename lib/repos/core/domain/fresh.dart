// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fresh.freezed.dart';

@freezed
class Fresh<T> with _$Fresh<T> {
  const Fresh._();
  const factory Fresh({
    required bool isFresh,
    required bool isNextPageAvailable,
    required T data,
  }) = _Fresh<T>;

  factory Fresh.yes(
    T data, {
    required bool isNextPageAvailable,
  }) {
    return Fresh(
      isFresh: true,
      isNextPageAvailable: isNextPageAvailable,
      data: data,
    );
  }

  factory Fresh.no(
    T data, {
    bool isNextPageAvailable = false,
  }) {
    return Fresh(
      isFresh: false,
      isNextPageAvailable: isNextPageAvailable,
      data: data,
    );
  }
}
