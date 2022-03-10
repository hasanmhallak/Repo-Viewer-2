import 'package:freezed_annotation/freezed_annotation.dart';

part 'starred_event.freezed.dart';

@freezed
class StarredEvent with _$StarredEvent {
  const StarredEvent._();
  const factory StarredEvent.getNextPage() = GetNextPage;
  const factory StarredEvent.retry() = Retry;
}
