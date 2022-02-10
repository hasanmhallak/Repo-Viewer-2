// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fresh.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FreshTearOff {
  const _$FreshTearOff();

  _Fresh<T> call<T>(
      {required bool isFresh,
      required bool isNextPageAvailable,
      required T data}) {
    return _Fresh<T>(
      isFresh: isFresh,
      isNextPageAvailable: isNextPageAvailable,
      data: data,
    );
  }
}

/// @nodoc
const $Fresh = _$FreshTearOff();

/// @nodoc
mixin _$Fresh<T> {
  bool get isFresh => throw _privateConstructorUsedError;
  bool get isNextPageAvailable => throw _privateConstructorUsedError;
  T get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FreshCopyWith<T, Fresh<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreshCopyWith<T, $Res> {
  factory $FreshCopyWith(Fresh<T> value, $Res Function(Fresh<T>) then) =
      _$FreshCopyWithImpl<T, $Res>;
  $Res call({bool isFresh, bool isNextPageAvailable, T data});
}

/// @nodoc
class _$FreshCopyWithImpl<T, $Res> implements $FreshCopyWith<T, $Res> {
  _$FreshCopyWithImpl(this._value, this._then);

  final Fresh<T> _value;
  // ignore: unused_field
  final $Res Function(Fresh<T>) _then;

  @override
  $Res call({
    Object? isFresh = freezed,
    Object? isNextPageAvailable = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      isFresh: isFresh == freezed
          ? _value.isFresh
          : isFresh // ignore: cast_nullable_to_non_nullable
              as bool,
      isNextPageAvailable: isNextPageAvailable == freezed
          ? _value.isNextPageAvailable
          : isNextPageAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
abstract class _$FreshCopyWith<T, $Res> implements $FreshCopyWith<T, $Res> {
  factory _$FreshCopyWith(_Fresh<T> value, $Res Function(_Fresh<T>) then) =
      __$FreshCopyWithImpl<T, $Res>;
  @override
  $Res call({bool isFresh, bool isNextPageAvailable, T data});
}

/// @nodoc
class __$FreshCopyWithImpl<T, $Res> extends _$FreshCopyWithImpl<T, $Res>
    implements _$FreshCopyWith<T, $Res> {
  __$FreshCopyWithImpl(_Fresh<T> _value, $Res Function(_Fresh<T>) _then)
      : super(_value, (v) => _then(v as _Fresh<T>));

  @override
  _Fresh<T> get _value => super._value as _Fresh<T>;

  @override
  $Res call({
    Object? isFresh = freezed,
    Object? isNextPageAvailable = freezed,
    Object? data = freezed,
  }) {
    return _then(_Fresh<T>(
      isFresh: isFresh == freezed
          ? _value.isFresh
          : isFresh // ignore: cast_nullable_to_non_nullable
              as bool,
      isNextPageAvailable: isNextPageAvailable == freezed
          ? _value.isNextPageAvailable
          : isNextPageAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_Fresh<T> extends _Fresh<T> {
  const _$_Fresh(
      {required this.isFresh,
      required this.isNextPageAvailable,
      required this.data})
      : super._();

  @override
  final bool isFresh;
  @override
  final bool isNextPageAvailable;
  @override
  final T data;

  @override
  String toString() {
    return 'Fresh<$T>(isFresh: $isFresh, isNextPageAvailable: $isNextPageAvailable, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Fresh<T> &&
            const DeepCollectionEquality().equals(other.isFresh, isFresh) &&
            const DeepCollectionEquality()
                .equals(other.isNextPageAvailable, isNextPageAvailable) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isFresh),
      const DeepCollectionEquality().hash(isNextPageAvailable),
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$FreshCopyWith<T, _Fresh<T>> get copyWith =>
      __$FreshCopyWithImpl<T, _Fresh<T>>(this, _$identity);
}

abstract class _Fresh<T> extends Fresh<T> {
  const factory _Fresh(
      {required bool isFresh,
      required bool isNextPageAvailable,
      required T data}) = _$_Fresh<T>;
  const _Fresh._() : super._();

  @override
  bool get isFresh;
  @override
  bool get isNextPageAvailable;
  @override
  T get data;
  @override
  @JsonKey(ignore: true)
  _$FreshCopyWith<T, _Fresh<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
