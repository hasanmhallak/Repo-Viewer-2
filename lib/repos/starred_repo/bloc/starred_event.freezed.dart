// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'starred_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StarredEventTearOff {
  const _$StarredEventTearOff();

  _GetNextPage getNextPage() {
    return const _GetNextPage();
  }
}

/// @nodoc
const $StarredEvent = _$StarredEventTearOff();

/// @nodoc
mixin _$StarredEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNextPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getNextPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNextPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNextPage value) getNextPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetNextPage value)? getNextPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNextPage value)? getNextPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StarredEventCopyWith<$Res> {
  factory $StarredEventCopyWith(
          StarredEvent value, $Res Function(StarredEvent) then) =
      _$StarredEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$StarredEventCopyWithImpl<$Res> implements $StarredEventCopyWith<$Res> {
  _$StarredEventCopyWithImpl(this._value, this._then);

  final StarredEvent _value;
  // ignore: unused_field
  final $Res Function(StarredEvent) _then;
}

/// @nodoc
abstract class _$GetNextPageCopyWith<$Res> {
  factory _$GetNextPageCopyWith(
          _GetNextPage value, $Res Function(_GetNextPage) then) =
      __$GetNextPageCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetNextPageCopyWithImpl<$Res> extends _$StarredEventCopyWithImpl<$Res>
    implements _$GetNextPageCopyWith<$Res> {
  __$GetNextPageCopyWithImpl(
      _GetNextPage _value, $Res Function(_GetNextPage) _then)
      : super(_value, (v) => _then(v as _GetNextPage));

  @override
  _GetNextPage get _value => super._value as _GetNextPage;
}

/// @nodoc

class _$_GetNextPage extends _GetNextPage {
  const _$_GetNextPage() : super._();

  @override
  String toString() {
    return 'StarredEvent.getNextPage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GetNextPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNextPage,
  }) {
    return getNextPage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getNextPage,
  }) {
    return getNextPage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNextPage,
    required TResult orElse(),
  }) {
    if (getNextPage != null) {
      return getNextPage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNextPage value) getNextPage,
  }) {
    return getNextPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetNextPage value)? getNextPage,
  }) {
    return getNextPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNextPage value)? getNextPage,
    required TResult orElse(),
  }) {
    if (getNextPage != null) {
      return getNextPage(this);
    }
    return orElse();
  }
}

abstract class _GetNextPage extends StarredEvent {
  const factory _GetNextPage() = _$_GetNextPage;
  const _GetNextPage._() : super._();
}
