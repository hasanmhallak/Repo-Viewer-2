// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'header_dto.freezed.dart';
part 'header_dto.g.dart';

//! No need to check for null in headers because [Dio] will put an
//! empty [String] in the list Like this:
//! [""];
//! But the headers key may be not exist so we must provide a default value.

@freezed
class HeaderDTO with _$HeaderDTO {
  const HeaderDTO._();
  const factory HeaderDTO({
    @JsonKey(
      defaultValue: '',
    )
        required String url,
    @JsonKey(
      defaultValue: '',
      name: 'Etag',
    )
        required String etag,
    @JsonKey(
      defaultValue: 0,
      name: 'X-Next-Page',
    )
        required int nextPage,
  }) = _HeaderDTO;
  factory HeaderDTO.fromJson(Map<String, dynamic> json) =>
      _$HeaderDTOFromJson(json);

  factory HeaderDTO.parse(String url, Map<String, List<String>> headers) {
    // checkimg if the key is not exist.
    final nextPageAsString = headers['X-Next-Page']?[0] ?? '';
    final nextPageAsIntOrNull = int.tryParse(nextPageAsString);
    return HeaderDTO(
      url: url,
      etag: headers['Etag']?[0] ?? '',
      nextPage: nextPageAsIntOrNull ?? 0,
    );
  }
}
