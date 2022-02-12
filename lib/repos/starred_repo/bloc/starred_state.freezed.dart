// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'starred_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StarredStateTearOff {
  const _$StarredStateTearOff();

  _Initial initial(Fresh<List<Repo>> freshRepos) {
    return _Initial(
      freshRepos,
    );
  }

  _Loading loading(Fresh<List<Repo>> freshRepos) {
    return _Loading(
      freshRepos,
    );
  }

  _Loaded loaded(Fresh<List<Repo>> freshRepos) {
    return _Loaded(
      freshRepos,
    );
  }

  _Failure failure(RepoFailure failure, Fresh<List<Repo>> freshRepos) {
    return _Failure(
      failure,
      freshRepos,
    );
  }
}

/// @nodoc
const $StarredState = _$StarredStateTearOff();

/// @nodoc
mixin _$StarredState {
  Fresh<List<Repo>> get freshRepos => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Repo>> freshRepos) initial,
    required TResult Function(Fresh<List<Repo>> freshRepos) loading,
    required TResult Function(Fresh<List<Repo>> freshRepos) loaded,
    required TResult Function(RepoFailure failure, Fresh<List<Repo>> freshRepos)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Fresh<List<Repo>> freshRepos)? initial,
    TResult Function(Fresh<List<Repo>> freshRepos)? loading,
    TResult Function(Fresh<List<Repo>> freshRepos)? loaded,
    TResult Function(RepoFailure failure, Fresh<List<Repo>> freshRepos)?
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Repo>> freshRepos)? initial,
    TResult Function(Fresh<List<Repo>> freshRepos)? loading,
    TResult Function(Fresh<List<Repo>> freshRepos)? loaded,
    TResult Function(RepoFailure failure, Fresh<List<Repo>> freshRepos)?
        failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StarredStateCopyWith<StarredState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StarredStateCopyWith<$Res> {
  factory $StarredStateCopyWith(
          StarredState value, $Res Function(StarredState) then) =
      _$StarredStateCopyWithImpl<$Res>;
  $Res call({Fresh<List<Repo>> freshRepos});

  $FreshCopyWith<List<Repo>, $Res> get freshRepos;
}

/// @nodoc
class _$StarredStateCopyWithImpl<$Res> implements $StarredStateCopyWith<$Res> {
  _$StarredStateCopyWithImpl(this._value, this._then);

  final StarredState _value;
  // ignore: unused_field
  final $Res Function(StarredState) _then;

  @override
  $Res call({
    Object? freshRepos = freezed,
  }) {
    return _then(_value.copyWith(
      freshRepos: freshRepos == freezed
          ? _value.freshRepos
          : freshRepos // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Repo>>,
    ));
  }

  @override
  $FreshCopyWith<List<Repo>, $Res> get freshRepos {
    return $FreshCopyWith<List<Repo>, $Res>(_value.freshRepos, (value) {
      return _then(_value.copyWith(freshRepos: value));
    });
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> implements $StarredStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({Fresh<List<Repo>> freshRepos});

  @override
  $FreshCopyWith<List<Repo>, $Res> get freshRepos;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$StarredStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? freshRepos = freezed,
  }) {
    return _then(_Initial(
      freshRepos == freezed
          ? _value.freshRepos
          : freshRepos // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Repo>>,
    ));
  }
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial(this.freshRepos) : super._();

  @override
  final Fresh<List<Repo>> freshRepos;

  @override
  String toString() {
    return 'StarredState.initial(freshRepos: $freshRepos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            const DeepCollectionEquality()
                .equals(other.freshRepos, freshRepos));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(freshRepos));

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Repo>> freshRepos) initial,
    required TResult Function(Fresh<List<Repo>> freshRepos) loading,
    required TResult Function(Fresh<List<Repo>> freshRepos) loaded,
    required TResult Function(RepoFailure failure, Fresh<List<Repo>> freshRepos)
        failure,
  }) {
    return initial(freshRepos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Fresh<List<Repo>> freshRepos)? initial,
    TResult Function(Fresh<List<Repo>> freshRepos)? loading,
    TResult Function(Fresh<List<Repo>> freshRepos)? loaded,
    TResult Function(RepoFailure failure, Fresh<List<Repo>> freshRepos)?
        failure,
  }) {
    return initial?.call(freshRepos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Repo>> freshRepos)? initial,
    TResult Function(Fresh<List<Repo>> freshRepos)? loading,
    TResult Function(Fresh<List<Repo>> freshRepos)? loaded,
    TResult Function(RepoFailure failure, Fresh<List<Repo>> freshRepos)?
        failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(freshRepos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends StarredState {
  const factory _Initial(Fresh<List<Repo>> freshRepos) = _$_Initial;
  const _Initial._() : super._();

  @override
  Fresh<List<Repo>> get freshRepos;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> implements $StarredStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call({Fresh<List<Repo>> freshRepos});

  @override
  $FreshCopyWith<List<Repo>, $Res> get freshRepos;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$StarredStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object? freshRepos = freezed,
  }) {
    return _then(_Loading(
      freshRepos == freezed
          ? _value.freshRepos
          : freshRepos // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Repo>>,
    ));
  }
}

/// @nodoc

class _$_Loading extends _Loading {
  const _$_Loading(this.freshRepos) : super._();

  @override
  final Fresh<List<Repo>> freshRepos;

  @override
  String toString() {
    return 'StarredState.loading(freshRepos: $freshRepos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            const DeepCollectionEquality()
                .equals(other.freshRepos, freshRepos));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(freshRepos));

  @JsonKey(ignore: true)
  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Repo>> freshRepos) initial,
    required TResult Function(Fresh<List<Repo>> freshRepos) loading,
    required TResult Function(Fresh<List<Repo>> freshRepos) loaded,
    required TResult Function(RepoFailure failure, Fresh<List<Repo>> freshRepos)
        failure,
  }) {
    return loading(freshRepos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Fresh<List<Repo>> freshRepos)? initial,
    TResult Function(Fresh<List<Repo>> freshRepos)? loading,
    TResult Function(Fresh<List<Repo>> freshRepos)? loaded,
    TResult Function(RepoFailure failure, Fresh<List<Repo>> freshRepos)?
        failure,
  }) {
    return loading?.call(freshRepos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Repo>> freshRepos)? initial,
    TResult Function(Fresh<List<Repo>> freshRepos)? loading,
    TResult Function(Fresh<List<Repo>> freshRepos)? loaded,
    TResult Function(RepoFailure failure, Fresh<List<Repo>> freshRepos)?
        failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(freshRepos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends StarredState {
  const factory _Loading(Fresh<List<Repo>> freshRepos) = _$_Loading;
  const _Loading._() : super._();

  @override
  Fresh<List<Repo>> get freshRepos;
  @override
  @JsonKey(ignore: true)
  _$LoadingCopyWith<_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res> implements $StarredStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  @override
  $Res call({Fresh<List<Repo>> freshRepos});

  @override
  $FreshCopyWith<List<Repo>, $Res> get freshRepos;
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> extends _$StarredStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object? freshRepos = freezed,
  }) {
    return _then(_Loaded(
      freshRepos == freezed
          ? _value.freshRepos
          : freshRepos // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Repo>>,
    ));
  }
}

/// @nodoc

class _$_Loaded extends _Loaded {
  const _$_Loaded(this.freshRepos) : super._();

  @override
  final Fresh<List<Repo>> freshRepos;

  @override
  String toString() {
    return 'StarredState.loaded(freshRepos: $freshRepos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            const DeepCollectionEquality()
                .equals(other.freshRepos, freshRepos));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(freshRepos));

  @JsonKey(ignore: true)
  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Repo>> freshRepos) initial,
    required TResult Function(Fresh<List<Repo>> freshRepos) loading,
    required TResult Function(Fresh<List<Repo>> freshRepos) loaded,
    required TResult Function(RepoFailure failure, Fresh<List<Repo>> freshRepos)
        failure,
  }) {
    return loaded(freshRepos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Fresh<List<Repo>> freshRepos)? initial,
    TResult Function(Fresh<List<Repo>> freshRepos)? loading,
    TResult Function(Fresh<List<Repo>> freshRepos)? loaded,
    TResult Function(RepoFailure failure, Fresh<List<Repo>> freshRepos)?
        failure,
  }) {
    return loaded?.call(freshRepos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Repo>> freshRepos)? initial,
    TResult Function(Fresh<List<Repo>> freshRepos)? loading,
    TResult Function(Fresh<List<Repo>> freshRepos)? loaded,
    TResult Function(RepoFailure failure, Fresh<List<Repo>> freshRepos)?
        failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(freshRepos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded extends StarredState {
  const factory _Loaded(Fresh<List<Repo>> freshRepos) = _$_Loaded;
  const _Loaded._() : super._();

  @override
  Fresh<List<Repo>> get freshRepos;
  @override
  @JsonKey(ignore: true)
  _$LoadedCopyWith<_Loaded> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FailureCopyWith<$Res> implements $StarredStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) then) =
      __$FailureCopyWithImpl<$Res>;
  @override
  $Res call({RepoFailure failure, Fresh<List<Repo>> freshRepos});

  $RepoFailureCopyWith<$Res> get failure;
  @override
  $FreshCopyWith<List<Repo>, $Res> get freshRepos;
}

/// @nodoc
class __$FailureCopyWithImpl<$Res> extends _$StarredStateCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(_Failure _value, $Res Function(_Failure) _then)
      : super(_value, (v) => _then(v as _Failure));

  @override
  _Failure get _value => super._value as _Failure;

  @override
  $Res call({
    Object? failure = freezed,
    Object? freshRepos = freezed,
  }) {
    return _then(_Failure(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as RepoFailure,
      freshRepos == freezed
          ? _value.freshRepos
          : freshRepos // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Repo>>,
    ));
  }

  @override
  $RepoFailureCopyWith<$Res> get failure {
    return $RepoFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_Failure extends _Failure {
  const _$_Failure(this.failure, this.freshRepos) : super._();

  @override
  final RepoFailure failure;
  @override
  final Fresh<List<Repo>> freshRepos;

  @override
  String toString() {
    return 'StarredState.failure(failure: $failure, freshRepos: $freshRepos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Failure &&
            const DeepCollectionEquality().equals(other.failure, failure) &&
            const DeepCollectionEquality()
                .equals(other.freshRepos, freshRepos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failure),
      const DeepCollectionEquality().hash(freshRepos));

  @JsonKey(ignore: true)
  @override
  _$FailureCopyWith<_Failure> get copyWith =>
      __$FailureCopyWithImpl<_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Repo>> freshRepos) initial,
    required TResult Function(Fresh<List<Repo>> freshRepos) loading,
    required TResult Function(Fresh<List<Repo>> freshRepos) loaded,
    required TResult Function(RepoFailure failure, Fresh<List<Repo>> freshRepos)
        failure,
  }) {
    return failure(this.failure, freshRepos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Fresh<List<Repo>> freshRepos)? initial,
    TResult Function(Fresh<List<Repo>> freshRepos)? loading,
    TResult Function(Fresh<List<Repo>> freshRepos)? loaded,
    TResult Function(RepoFailure failure, Fresh<List<Repo>> freshRepos)?
        failure,
  }) {
    return failure?.call(this.failure, freshRepos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Repo>> freshRepos)? initial,
    TResult Function(Fresh<List<Repo>> freshRepos)? loading,
    TResult Function(Fresh<List<Repo>> freshRepos)? loaded,
    TResult Function(RepoFailure failure, Fresh<List<Repo>> freshRepos)?
        failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure, freshRepos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure extends StarredState {
  const factory _Failure(RepoFailure failure, Fresh<List<Repo>> freshRepos) =
      _$_Failure;
  const _Failure._() : super._();

  RepoFailure get failure;
  @override
  Fresh<List<Repo>> get freshRepos;
  @override
  @JsonKey(ignore: true)
  _$FailureCopyWith<_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}
