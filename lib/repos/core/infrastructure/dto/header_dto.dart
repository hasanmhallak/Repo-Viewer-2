// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'header_dto.freezed.dart';
part 'header_dto.g.dart';

//! No need to check for null in the headers because [Dio] will put an
//! empty [String] in the list Like this:
//! [""];
//! But the headers key may be not exist so we must provide a default value.

String _stringFromJson(List<String> list) {
  return list[0];
}

int _nextPageFromJson(List<String> list) {
  final nextPageAsString = list[0];
  final nextPageAsIntOrNull = int.tryParse(nextPageAsString);
  return nextPageAsIntOrNull ?? 0;
}

@freezed
class HeaderDTO with _$HeaderDTO {
  const HeaderDTO._();
  const factory HeaderDTO({
    @JsonKey(
      defaultValue: '',
      fromJson: _stringFromJson,
    )
        required String url,
    @JsonKey(
      defaultValue: '',
      fromJson: _stringFromJson,
      name: 'Etag',
    )
        required String etag,
    @JsonKey(
      defaultValue: 0,
      fromJson: _nextPageFromJson,
      name: 'X-Next-Page',
    )
        required int nextPage,
  }) = _HeaderDTO;
  factory HeaderDTO.fromJson(Map<String, dynamic> json) =>
      _$HeaderDTOFromJson(json);

  HeaderDTO parse(String url, Map<String, List<String>> headers) {
    // checkimg if the key is not exist.
    final nextPageAsString = headers['Etag']?[0] ?? '';
    final nextPageAsIntOrNull = int.tryParse(nextPageAsString);
    return HeaderDTO(
      url: url,
      etag: headers['Etag']?[0] ?? '',
      nextPage: nextPageAsIntOrNull ?? 0,
    );
  }
}
