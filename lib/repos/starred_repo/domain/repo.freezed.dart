// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'repo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RepoTearOff {
  const _$RepoTearOff();

  _Repo call(
      {required int order,
      required int id,
      required String name,
      required String description,
      required int starCount,
      required String avatarUrl}) {
    return _Repo(
      order: order,
      id: id,
      name: name,
      description: description,
      starCount: starCount,
      avatarUrl: avatarUrl,
    );
  }
}

/// @nodoc
const $Repo = _$RepoTearOff();

/// @nodoc
mixin _$Repo {
  int get order => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get starCount => throw _privateConstructorUsedError;
  String get avatarUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepoCopyWith<Repo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoCopyWith<$Res> {
  factory $RepoCopyWith(Repo value, $Res Function(Repo) then) =
      _$RepoCopyWithImpl<$Res>;
  $Res call(
      {int order,
      int id,
      String name,
      String description,
      int starCount,
      String avatarUrl});
}

/// @nodoc
class _$RepoCopyWithImpl<$Res> implements $RepoCopyWith<$Res> {
  _$RepoCopyWithImpl(this._value, this._then);

  final Repo _value;
  // ignore: unused_field
  final $Res Function(Repo) _then;

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
abstract class _$RepoCopyWith<$Res> implements $RepoCopyWith<$Res> {
  factory _$RepoCopyWith(_Repo value, $Res Function(_Repo) then) =
      __$RepoCopyWithImpl<$Res>;
  @override
  $Res call(
      {int order,
      int id,
      String name,
      String description,
      int starCount,
      String avatarUrl});
}

/// @nodoc
class __$RepoCopyWithImpl<$Res> extends _$RepoCopyWithImpl<$Res>
    implements _$RepoCopyWith<$Res> {
  __$RepoCopyWithImpl(_Repo _value, $Res Function(_Repo) _then)
      : super(_value, (v) => _then(v as _Repo));

  @override
  _Repo get _value => super._value as _Repo;

  @override
  $Res call({
    Object? order = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? starCount = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_Repo(
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

class _$_Repo extends _Repo {
  const _$_Repo(
      {required this.order,
      required this.id,
      required this.name,
      required this.description,
      required this.starCount,
      required this.avatarUrl})
      : super._();

  @override
  final int order;
  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final int starCount;
  @override
  final String avatarUrl;

  @override
  String toString() {
    return 'Repo(order: $order, id: $id, name: $name, description: $description, starCount: $starCount, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Repo &&
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
  _$RepoCopyWith<_Repo> get copyWith =>
      __$RepoCopyWithImpl<_Repo>(this, _$identity);
}

abstract class _Repo extends Repo {
  const factory _Repo(
      {required int order,
      required int id,
      required String name,
      required String description,
      required int starCount,
      required String avatarUrl}) = _$_Repo;
  const _Repo._() : super._();

  @override
  int get order;
  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  int get starCount;
  @override
  String get avatarUrl;
  @override
  @JsonKey(ignore: true)
  _$RepoCopyWith<_Repo> get copyWith => throw _privateConstructorUsedError;
}
