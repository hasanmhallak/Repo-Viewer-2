// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_response.freezed.dart';

@freezed
class RemoteResponse<T> with _$RemoteResponse<T> {
  const RemoteResponse._();
  const factory RemoteResponse.noConnection() = _NoConnection<T>;
  const factory RemoteResponse.notModified({
    required bool isNextPageAvailable,
  }) = _NotModified<T>;
  const factory RemoteResponse.withData({
    required T data,
    required bool isNextPageAvailable,
  }) = _WithData<T>;
}
