// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'remote_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RemoteResponseTearOff {
  const _$RemoteResponseTearOff();

  _NoConnection<T> noConnection<T>() {
    return _NoConnection<T>();
  }

  _NotModified<T> notModified<T>(
      {required HeaderDTO headers, required bool isNextPageAvailable}) {
    return _NotModified<T>(
      headers: headers,
      isNextPageAvailable: isNextPageAvailable,
    );
  }

  _WithData<T> withData<T>(
      {required T data,
      required HeaderDTO headers,
      required bool isNextPageAvailable}) {
    return _WithData<T>(
      data: data,
      headers: headers,
      isNextPageAvailable: isNextPageAvailable,
    );
  }
}

/// @nodoc
const $RemoteResponse = _$RemoteResponseTearOff();

/// @nodoc
mixin _$RemoteResponse<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(HeaderDTO headers, bool isNextPageAvailable)
        notModified,
    required TResult Function(
            T data, HeaderDTO headers, bool isNextPageAvailable)
        withData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(HeaderDTO headers, bool isNextPageAvailable)? notModified,
    TResult Function(T data, HeaderDTO headers, bool isNextPageAvailable)?
        withData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(HeaderDTO headers, bool isNextPageAvailable)? notModified,
    TResult Function(T data, HeaderDTO headers, bool isNextPageAvailable)?
        withData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection<T> value) noConnection,
    required TResult Function(_NotModified<T> value) notModified,
    required TResult Function(_WithData<T> value) withData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_NotModified<T> value)? notModified,
    TResult Function(_WithData<T> value)? withData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_NotModified<T> value)? notModified,
    TResult Function(_WithData<T> value)? withData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteResponseCopyWith<T, $Res> {
  factory $RemoteResponseCopyWith(
          RemoteResponse<T> value, $Res Function(RemoteResponse<T>) then) =
      _$RemoteResponseCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$RemoteResponseCopyWithImpl<T, $Res>
    implements $RemoteResponseCopyWith<T, $Res> {
  _$RemoteResponseCopyWithImpl(this._value, this._then);

  final RemoteResponse<T> _value;
  // ignore: unused_field
  final $Res Function(RemoteResponse<T>) _then;
}

/// @nodoc
abstract class _$NoConnectionCopyWith<T, $Res> {
  factory _$NoConnectionCopyWith(
          _NoConnection<T> value, $Res Function(_NoConnection<T>) then) =
      __$NoConnectionCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$NoConnectionCopyWithImpl<T, $Res>
    extends _$RemoteResponseCopyWithImpl<T, $Res>
    implements _$NoConnectionCopyWith<T, $Res> {
  __$NoConnectionCopyWithImpl(
      _NoConnection<T> _value, $Res Function(_NoConnection<T>) _then)
      : super(_value, (v) => _then(v as _NoConnection<T>));

  @override
  _NoConnection<T> get _value => super._value as _NoConnection<T>;
}

/// @nodoc

class _$_NoConnection<T> extends _NoConnection<T> {
  const _$_NoConnection() : super._();

  @override
  String toString() {
    return 'RemoteResponse<$T>.noConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NoConnection<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(HeaderDTO headers, bool isNextPageAvailable)
        notModified,
    required TResult Function(
            T data, HeaderDTO headers, bool isNextPageAvailable)
        withData,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(HeaderDTO headers, bool isNextPageAvailable)? notModified,
    TResult Function(T data, HeaderDTO headers, bool isNextPageAvailable)?
        withData,
  }) {
    return noConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(HeaderDTO headers, bool isNextPageAvailable)? notModified,
    TResult Function(T data, HeaderDTO headers, bool isNextPageAvailable)?
        withData,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection<T> value) noConnection,
    required TResult Function(_NotModified<T> value) notModified,
    required TResult Function(_WithData<T> value) withData,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_NotModified<T> value)? notModified,
    TResult Function(_WithData<T> value)? withData,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_NotModified<T> value)? notModified,
    TResult Function(_WithData<T> value)? withData,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class _NoConnection<T> extends RemoteResponse<T> {
  const factory _NoConnection() = _$_NoConnection<T>;
  const _NoConnection._() : super._();
}

/// @nodoc
abstract class _$NotModifiedCopyWith<T, $Res> {
  factory _$NotModifiedCopyWith(
          _NotModified<T> value, $Res Function(_NotModified<T>) then) =
      __$NotModifiedCopyWithImpl<T, $Res>;
  $Res call({HeaderDTO headers, bool isNextPageAvailable});

  $HeaderDTOCopyWith<$Res> get headers;
}

/// @nodoc
class __$NotModifiedCopyWithImpl<T, $Res>
    extends _$RemoteResponseCopyWithImpl<T, $Res>
    implements _$NotModifiedCopyWith<T, $Res> {
  __$NotModifiedCopyWithImpl(
      _NotModified<T> _value, $Res Function(_NotModified<T>) _then)
      : super(_value, (v) => _then(v as _NotModified<T>));

  @override
  _NotModified<T> get _value => super._value as _NotModified<T>;

  @override
  $Res call({
    Object? headers = freezed,
    Object? isNextPageAvailable = freezed,
  }) {
    return _then(_NotModified<T>(
      headers: headers == freezed
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as HeaderDTO,
      isNextPageAvailable: isNextPageAvailable == freezed
          ? _value.isNextPageAvailable
          : isNextPageAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $HeaderDTOCopyWith<$Res> get headers {
    return $HeaderDTOCopyWith<$Res>(_value.headers, (value) {
      return _then(_value.copyWith(headers: value));
    });
  }
}

/// @nodoc

class _$_NotModified<T> extends _NotModified<T> {
  const _$_NotModified(
      {required this.headers, required this.isNextPageAvailable})
      : super._();

  @override
  final HeaderDTO headers;
  @override
  final bool isNextPageAvailable;

  @override
  String toString() {
    return 'RemoteResponse<$T>.notModified(headers: $headers, isNextPageAvailable: $isNextPageAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotModified<T> &&
            const DeepCollectionEquality().equals(other.headers, headers) &&
            const DeepCollectionEquality()
                .equals(other.isNextPageAvailable, isNextPageAvailable));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(headers),
      const DeepCollectionEquality().hash(isNextPageAvailable));

  @JsonKey(ignore: true)
  @override
  _$NotModifiedCopyWith<T, _NotModified<T>> get copyWith =>
      __$NotModifiedCopyWithImpl<T, _NotModified<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(HeaderDTO headers, bool isNextPageAvailable)
        notModified,
    required TResult Function(
            T data, HeaderDTO headers, bool isNextPageAvailable)
        withData,
  }) {
    return notModified(headers, isNextPageAvailable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(HeaderDTO headers, bool isNextPageAvailable)? notModified,
    TResult Function(T data, HeaderDTO headers, bool isNextPageAvailable)?
        withData,
  }) {
    return notModified?.call(headers, isNextPageAvailable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(HeaderDTO headers, bool isNextPageAvailable)? notModified,
    TResult Function(T data, HeaderDTO headers, bool isNextPageAvailable)?
        withData,
    required TResult orElse(),
  }) {
    if (notModified != null) {
      return notModified(headers, isNextPageAvailable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection<T> value) noConnection,
    required TResult Function(_NotModified<T> value) notModified,
    required TResult Function(_WithData<T> value) withData,
  }) {
    return notModified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_NotModified<T> value)? notModified,
    TResult Function(_WithData<T> value)? withData,
  }) {
    return notModified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_NotModified<T> value)? notModified,
    TResult Function(_WithData<T> value)? withData,
    required TResult orElse(),
  }) {
    if (notModified != null) {
      return notModified(this);
    }
    return orElse();
  }
}

abstract class _NotModified<T> extends RemoteResponse<T> {
  const factory _NotModified(
      {required HeaderDTO headers,
      required bool isNextPageAvailable}) = _$_NotModified<T>;
  const _NotModified._() : super._();

  HeaderDTO get headers;
  bool get isNextPageAvailable;
  @JsonKey(ignore: true)
  _$NotModifiedCopyWith<T, _NotModified<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$WithDataCopyWith<T, $Res> {
  factory _$WithDataCopyWith(
          _WithData<T> value, $Res Function(_WithData<T>) then) =
      __$WithDataCopyWithImpl<T, $Res>;
  $Res call({T data, HeaderDTO headers, bool isNextPageAvailable});

  $HeaderDTOCopyWith<$Res> get headers;
}

/// @nodoc
class __$WithDataCopyWithImpl<T, $Res>
    extends _$RemoteResponseCopyWithImpl<T, $Res>
    implements _$WithDataCopyWith<T, $Res> {
  __$WithDataCopyWithImpl(
      _WithData<T> _value, $Res Function(_WithData<T>) _then)
      : super(_value, (v) => _then(v as _WithData<T>));

  @override
  _WithData<T> get _value => super._value as _WithData<T>;

  @override
  $Res call({
    Object? data = freezed,
    Object? headers = freezed,
    Object? isNextPageAvailable = freezed,
  }) {
    return _then(_WithData<T>(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      headers: headers == freezed
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as HeaderDTO,
      isNextPageAvailable: isNextPageAvailable == freezed
          ? _value.isNextPageAvailable
          : isNextPageAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $HeaderDTOCopyWith<$Res> get headers {
    return $HeaderDTOCopyWith<$Res>(_value.headers, (value) {
      return _then(_value.copyWith(headers: value));
    });
  }
}

/// @nodoc

class _$_WithData<T> extends _WithData<T> {
  const _$_WithData(
      {required this.data,
      required this.headers,
      required this.isNextPageAvailable})
      : super._();

  @override
  final T data;
  @override
  final HeaderDTO headers;
  @override
  final bool isNextPageAvailable;

  @override
  String toString() {
    return 'RemoteResponse<$T>.withData(data: $data, headers: $headers, isNextPageAvailable: $isNextPageAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WithData<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.headers, headers) &&
            const DeepCollectionEquality()
                .equals(other.isNextPageAvailable, isNextPageAvailable));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(headers),
      const DeepCollectionEquality().hash(isNextPageAvailable));

  @JsonKey(ignore: true)
  @override
  _$WithDataCopyWith<T, _WithData<T>> get copyWith =>
      __$WithDataCopyWithImpl<T, _WithData<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(HeaderDTO headers, bool isNextPageAvailable)
        notModified,
    required TResult Function(
            T data, HeaderDTO headers, bool isNextPageAvailable)
        withData,
  }) {
    return withData(data, headers, isNextPageAvailable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(HeaderDTO headers, bool isNextPageAvailable)? notModified,
    TResult Function(T data, HeaderDTO headers, bool isNextPageAvailable)?
        withData,
  }) {
    return withData?.call(data, headers, isNextPageAvailable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(HeaderDTO headers, bool isNextPageAvailable)? notModified,
    TResult Function(T data, HeaderDTO headers, bool isNextPageAvailable)?
        withData,
    required TResult orElse(),
  }) {
    if (withData != null) {
      return withData(data, headers, isNextPageAvailable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection<T> value) noConnection,
    required TResult Function(_NotModified<T> value) notModified,
    required TResult Function(_WithData<T> value) withData,
  }) {
    return withData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_NotModified<T> value)? notModified,
    TResult Function(_WithData<T> value)? withData,
  }) {
    return withData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_NotModified<T> value)? notModified,
    TResult Function(_WithData<T> value)? withData,
    required TResult orElse(),
  }) {
    if (withData != null) {
      return withData(this);
    }
    return orElse();
  }
}

abstract class _WithData<T> extends RemoteResponse<T> {
  const factory _WithData(
      {required T data,
      required HeaderDTO headers,
      required bool isNextPageAvailable}) = _$_WithData<T>;
  const _WithData._() : super._();

  T get data;
  HeaderDTO get headers;
  bool get isNextPageAvailable;
  @JsonKey(ignore: true)
  _$WithDataCopyWith<T, _WithData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
