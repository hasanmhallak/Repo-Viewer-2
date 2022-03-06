// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'header_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HeaderDTO _$HeaderDTOFromJson(Map<String, dynamic> json) {
  return _HeaderDTO.fromJson(json);
}

/// @nodoc
class _$HeaderDTOTearOff {
  const _$HeaderDTOTearOff();

  _HeaderDTO call(
      {@JsonKey(defaultValue: '') required String url,
      @JsonKey(defaultValue: '', name: 'Etag') required String etag,
      @JsonKey(defaultValue: 0, name: 'X-Next-Page') required int nextPage}) {
    return _HeaderDTO(
      url: url,
      etag: etag,
      nextPage: nextPage,
    );
  }

  HeaderDTO fromJson(Map<String, Object?> json) {
    return HeaderDTO.fromJson(json);
  }
}

/// @nodoc
const $HeaderDTO = _$HeaderDTOTearOff();

/// @nodoc
mixin _$HeaderDTO {
  @JsonKey(defaultValue: '')
  String get url => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '', name: 'Etag')
  String get etag => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0, name: 'X-Next-Page')
  int get nextPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeaderDTOCopyWith<HeaderDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeaderDTOCopyWith<$Res> {
  factory $HeaderDTOCopyWith(HeaderDTO value, $Res Function(HeaderDTO) then) =
      _$HeaderDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(defaultValue: '') String url,
      @JsonKey(defaultValue: '', name: 'Etag') String etag,
      @JsonKey(defaultValue: 0, name: 'X-Next-Page') int nextPage});
}

/// @nodoc
class _$HeaderDTOCopyWithImpl<$Res> implements $HeaderDTOCopyWith<$Res> {
  _$HeaderDTOCopyWithImpl(this._value, this._then);

  final HeaderDTO _value;
  // ignore: unused_field
  final $Res Function(HeaderDTO) _then;

  @override
  $Res call({
    Object? url = freezed,
    Object? etag = freezed,
    Object? nextPage = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      etag: etag == freezed
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String,
      nextPage: nextPage == freezed
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$HeaderDTOCopyWith<$Res> implements $HeaderDTOCopyWith<$Res> {
  factory _$HeaderDTOCopyWith(
          _HeaderDTO value, $Res Function(_HeaderDTO) then) =
      __$HeaderDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(defaultValue: '') String url,
      @JsonKey(defaultValue: '', name: 'Etag') String etag,
      @JsonKey(defaultValue: 0, name: 'X-Next-Page') int nextPage});
}

/// @nodoc
class __$HeaderDTOCopyWithImpl<$Res> extends _$HeaderDTOCopyWithImpl<$Res>
    implements _$HeaderDTOCopyWith<$Res> {
  __$HeaderDTOCopyWithImpl(_HeaderDTO _value, $Res Function(_HeaderDTO) _then)
      : super(_value, (v) => _then(v as _HeaderDTO));

  @override
  _HeaderDTO get _value => super._value as _HeaderDTO;

  @override
  $Res call({
    Object? url = freezed,
    Object? etag = freezed,
    Object? nextPage = freezed,
  }) {
    return _then(_HeaderDTO(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      etag: etag == freezed
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String,
      nextPage: nextPage == freezed
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HeaderDTO extends _HeaderDTO {
  const _$_HeaderDTO(
      {@JsonKey(defaultValue: '') required this.url,
      @JsonKey(defaultValue: '', name: 'Etag') required this.etag,
      @JsonKey(defaultValue: 0, name: 'X-Next-Page') required this.nextPage})
      : super._();

  factory _$_HeaderDTO.fromJson(Map<String, dynamic> json) =>
      _$$_HeaderDTOFromJson(json);

  @override
  @JsonKey(defaultValue: '')
  final String url;
  @override
  @JsonKey(defaultValue: '', name: 'Etag')
  final String etag;
  @override
  @JsonKey(defaultValue: 0, name: 'X-Next-Page')
  final int nextPage;

  @override
  String toString() {
    return 'HeaderDTO(url: $url, etag: $etag, nextPage: $nextPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HeaderDTO &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.etag, etag) &&
            const DeepCollectionEquality().equals(other.nextPage, nextPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(etag),
      const DeepCollectionEquality().hash(nextPage));

  @JsonKey(ignore: true)
  @override
  _$HeaderDTOCopyWith<_HeaderDTO> get copyWith =>
      __$HeaderDTOCopyWithImpl<_HeaderDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HeaderDTOToJson(this);
  }
}

abstract class _HeaderDTO extends HeaderDTO {
  const factory _HeaderDTO(
      {@JsonKey(defaultValue: '')
          required String url,
      @JsonKey(defaultValue: '', name: 'Etag')
          required String etag,
      @JsonKey(defaultValue: 0, name: 'X-Next-Page')
          required int nextPage}) = _$_HeaderDTO;
  const _HeaderDTO._() : super._();

  factory _HeaderDTO.fromJson(Map<String, dynamic> json) =
      _$_HeaderDTO.fromJson;

  @override
  @JsonKey(defaultValue: '')
  String get url;
  @override
  @JsonKey(defaultValue: '', name: 'Etag')
  String get etag;
  @override
  @JsonKey(defaultValue: 0, name: 'X-Next-Page')
  int get nextPage;
  @override
  @JsonKey(ignore: true)
  _$HeaderDTOCopyWith<_HeaderDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
