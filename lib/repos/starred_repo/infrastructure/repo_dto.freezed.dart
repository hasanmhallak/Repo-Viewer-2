// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'repo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepoDTO _$RepoDTOFromJson(Map<String, dynamic> json) {
  return _RepoDTO.fromJson(json);
}

/// @nodoc
class _$RepoDTOTearOff {
  const _$RepoDTOTearOff();

  _RepoDTO call(
      {required int index,
      required int id,
      required String name,
      required String description,
      @JsonKey(name: 'star_count', fromJson: _formatStarCount)
          required String starCount,
      @JsonKey(name: 'avatar_url', fromJson: _checkForNull)
          required String avatarUrl}) {
    return _RepoDTO(
      index: index,
      id: id,
      name: name,
      description: description,
      starCount: starCount,
      avatarUrl: avatarUrl,
    );
  }

  RepoDTO fromJson(Map<String, Object?> json) {
    return RepoDTO.fromJson(json);
  }
}

/// @nodoc
const $RepoDTO = _$RepoDTOTearOff();

/// @nodoc
mixin _$RepoDTO {
  int get index => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'star_count', fromJson: _formatStarCount)
  String get starCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url', fromJson: _checkForNull)
  String get avatarUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepoDTOCopyWith<RepoDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoDTOCopyWith<$Res> {
  factory $RepoDTOCopyWith(RepoDTO value, $Res Function(RepoDTO) then) =
      _$RepoDTOCopyWithImpl<$Res>;
  $Res call(
      {int index,
      int id,
      String name,
      String description,
      @JsonKey(name: 'star_count', fromJson: _formatStarCount) String starCount,
      @JsonKey(name: 'avatar_url', fromJson: _checkForNull) String avatarUrl});
}

/// @nodoc
class _$RepoDTOCopyWithImpl<$Res> implements $RepoDTOCopyWith<$Res> {
  _$RepoDTOCopyWithImpl(this._value, this._then);

  final RepoDTO _value;
  // ignore: unused_field
  final $Res Function(RepoDTO) _then;

  @override
  $Res call({
    Object? index = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? starCount = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      starCount: starCount == freezed
          ? _value.starCount
          : starCount // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: avatarUrl == freezed
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RepoDTOCopyWith<$Res> implements $RepoDTOCopyWith<$Res> {
  factory _$RepoDTOCopyWith(_RepoDTO value, $Res Function(_RepoDTO) then) =
      __$RepoDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {int index,
      int id,
      String name,
      String description,
      @JsonKey(name: 'star_count', fromJson: _formatStarCount) String starCount,
      @JsonKey(name: 'avatar_url', fromJson: _checkForNull) String avatarUrl});
}

/// @nodoc
class __$RepoDTOCopyWithImpl<$Res> extends _$RepoDTOCopyWithImpl<$Res>
    implements _$RepoDTOCopyWith<$Res> {
  __$RepoDTOCopyWithImpl(_RepoDTO _value, $Res Function(_RepoDTO) _then)
      : super(_value, (v) => _then(v as _RepoDTO));

  @override
  _RepoDTO get _value => super._value as _RepoDTO;

  @override
  $Res call({
    Object? index = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? starCount = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_RepoDTO(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      starCount: starCount == freezed
          ? _value.starCount
          : starCount // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: avatarUrl == freezed
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RepoDTO extends _RepoDTO {
  const _$_RepoDTO(
      {required this.index,
      required this.id,
      required this.name,
      required this.description,
      @JsonKey(name: 'star_count', fromJson: _formatStarCount)
          required this.starCount,
      @JsonKey(name: 'avatar_url', fromJson: _checkForNull)
          required this.avatarUrl})
      : super._();

  factory _$_RepoDTO.fromJson(Map<String, dynamic> json) =>
      _$$_RepoDTOFromJson(json);

  @override
  final int index;
  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  @JsonKey(name: 'star_count', fromJson: _formatStarCount)
  final String starCount;
  @override
  @JsonKey(name: 'avatar_url', fromJson: _checkForNull)
  final String avatarUrl;

  @override
  String toString() {
    return 'RepoDTO(index: $index, id: $id, name: $name, description: $description, starCount: $starCount, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepoDTO &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.starCount, starCount) &&
            const DeepCollectionEquality().equals(other.avatarUrl, avatarUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(starCount),
      const DeepCollectionEquality().hash(avatarUrl));

  @JsonKey(ignore: true)
  @override
  _$RepoDTOCopyWith<_RepoDTO> get copyWith =>
      __$RepoDTOCopyWithImpl<_RepoDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RepoDTOToJson(this);
  }
}

abstract class _RepoDTO extends RepoDTO {
  const factory _RepoDTO(
      {required int index,
      required int id,
      required String name,
      required String description,
      @JsonKey(name: 'star_count', fromJson: _formatStarCount)
          required String starCount,
      @JsonKey(name: 'avatar_url', fromJson: _checkForNull)
          required String avatarUrl}) = _$_RepoDTO;
  const _RepoDTO._() : super._();

  factory _RepoDTO.fromJson(Map<String, dynamic> json) = _$_RepoDTO.fromJson;

  @override
  int get index;
  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(name: 'star_count', fromJson: _formatStarCount)
  String get starCount;
  @override
  @JsonKey(name: 'avatar_url', fromJson: _checkForNull)
  String get avatarUrl;
  @override
  @JsonKey(ignore: true)
  _$RepoDTOCopyWith<_RepoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
