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
      {required int order,
      required int id,
      required String name,
      required String description,
      @JsonKey(name: 'star_count') required int starCount,
      @JsonKey(name: 'avatar_url') required String avatarUrl}) {
    return _RepoDTO(
      order: order,
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
  int get order => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'star_count')
  int get starCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
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
      {int order,
      int id,
      String name,
      String description,
      @JsonKey(name: 'star_count') int starCount,
      @JsonKey(name: 'avatar_url') String avatarUrl});
}

/// @nodoc
class _$RepoDTOCopyWithImpl<$Res> implements $RepoDTOCopyWith<$Res> {
  _$RepoDTOCopyWithImpl(this._value, this._then);

  final RepoDTO _value;
  // ignore: unused_field
  final $Res Function(RepoDTO) _then;

  @override
  $Res call({
    Object? order = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? starCount = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_value.copyWith(
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
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
              as int,
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
      {int order,
      int id,
      String name,
      String description,
      @JsonKey(name: 'star_count') int starCount,
      @JsonKey(name: 'avatar_url') String avatarUrl});
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
    Object? order = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? starCount = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_RepoDTO(
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
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
              as int,
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
      {required this.order,
      required this.id,
      required this.name,
      required this.description,
      @JsonKey(name: 'star_count') required this.starCount,
      @JsonKey(name: 'avatar_url') required this.avatarUrl})
      : super._();

  factory _$_RepoDTO.fromJson(Map<String, dynamic> json) =>
      _$$_RepoDTOFromJson(json);

  @override
  final int order;
  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  @JsonKey(name: 'star_count')
  final int starCount;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  @override
  String toString() {
    return 'RepoDTO(order: $order, id: $id, name: $name, description: $description, starCount: $starCount, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepoDTO &&
            const DeepCollectionEquality().equals(other.order, order) &&
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
      const DeepCollectionEquality().hash(order),
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
      {required int order,
      required int id,
      required String name,
      required String description,
      @JsonKey(name: 'star_count') required int starCount,
      @JsonKey(name: 'avatar_url') required String avatarUrl}) = _$_RepoDTO;
  const _RepoDTO._() : super._();

  factory _RepoDTO.fromJson(Map<String, dynamic> json) = _$_RepoDTO.fromJson;

  @override
  int get order;
  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(name: 'star_count')
  int get starCount;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;
  @override
  @JsonKey(ignore: true)
  _$RepoDTOCopyWith<_RepoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
