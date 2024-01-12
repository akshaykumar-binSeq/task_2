// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppFailures {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function() insufficientPermission,
    required TResult Function(String message) firestoreFailure,
    required TResult Function() networkFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function()? insufficientPermission,
    TResult? Function(String message)? firestoreFailure,
    TResult? Function()? networkFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? insufficientPermission,
    TResult Function(String message)? firestoreFailure,
    TResult Function()? networkFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_InsufficientPermission value)
        insufficientPermission,
    required TResult Function(_FirestoreFailure value) firestoreFailure,
    required TResult Function(_NetworkFailure value) networkFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_InsufficientPermission value)? insufficientPermission,
    TResult? Function(_FirestoreFailure value)? firestoreFailure,
    TResult? Function(_NetworkFailure value)? networkFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_InsufficientPermission value)? insufficientPermission,
    TResult Function(_FirestoreFailure value)? firestoreFailure,
    TResult Function(_NetworkFailure value)? networkFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppFailuresCopyWith<$Res> {
  factory $AppFailuresCopyWith(
          AppFailures value, $Res Function(AppFailures) then) =
      _$AppFailuresCopyWithImpl<$Res, AppFailures>;
}

/// @nodoc
class _$AppFailuresCopyWithImpl<$Res, $Val extends AppFailures>
    implements $AppFailuresCopyWith<$Res> {
  _$AppFailuresCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UnexpectedImplCopyWith<$Res> {
  factory _$$UnexpectedImplCopyWith(
          _$UnexpectedImpl value, $Res Function(_$UnexpectedImpl) then) =
      __$$UnexpectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnexpectedImplCopyWithImpl<$Res>
    extends _$AppFailuresCopyWithImpl<$Res, _$UnexpectedImpl>
    implements _$$UnexpectedImplCopyWith<$Res> {
  __$$UnexpectedImplCopyWithImpl(
      _$UnexpectedImpl _value, $Res Function(_$UnexpectedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnexpectedImpl implements _Unexpected {
  const _$UnexpectedImpl();

  @override
  String toString() {
    return 'AppFailures.unexpected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnexpectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function() insufficientPermission,
    required TResult Function(String message) firestoreFailure,
    required TResult Function() networkFailure,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function()? insufficientPermission,
    TResult? Function(String message)? firestoreFailure,
    TResult? Function()? networkFailure,
  }) {
    return unexpected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? insufficientPermission,
    TResult Function(String message)? firestoreFailure,
    TResult Function()? networkFailure,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_InsufficientPermission value)
        insufficientPermission,
    required TResult Function(_FirestoreFailure value) firestoreFailure,
    required TResult Function(_NetworkFailure value) networkFailure,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_InsufficientPermission value)? insufficientPermission,
    TResult? Function(_FirestoreFailure value)? firestoreFailure,
    TResult? Function(_NetworkFailure value)? networkFailure,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_InsufficientPermission value)? insufficientPermission,
    TResult Function(_FirestoreFailure value)? firestoreFailure,
    TResult Function(_NetworkFailure value)? networkFailure,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected implements AppFailures {
  const factory _Unexpected() = _$UnexpectedImpl;
}

/// @nodoc
abstract class _$$InsufficientPermissionImplCopyWith<$Res> {
  factory _$$InsufficientPermissionImplCopyWith(
          _$InsufficientPermissionImpl value,
          $Res Function(_$InsufficientPermissionImpl) then) =
      __$$InsufficientPermissionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InsufficientPermissionImplCopyWithImpl<$Res>
    extends _$AppFailuresCopyWithImpl<$Res, _$InsufficientPermissionImpl>
    implements _$$InsufficientPermissionImplCopyWith<$Res> {
  __$$InsufficientPermissionImplCopyWithImpl(
      _$InsufficientPermissionImpl _value,
      $Res Function(_$InsufficientPermissionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InsufficientPermissionImpl implements _InsufficientPermission {
  const _$InsufficientPermissionImpl();

  @override
  String toString() {
    return 'AppFailures.insufficientPermission()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsufficientPermissionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function() insufficientPermission,
    required TResult Function(String message) firestoreFailure,
    required TResult Function() networkFailure,
  }) {
    return insufficientPermission();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function()? insufficientPermission,
    TResult? Function(String message)? firestoreFailure,
    TResult? Function()? networkFailure,
  }) {
    return insufficientPermission?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? insufficientPermission,
    TResult Function(String message)? firestoreFailure,
    TResult Function()? networkFailure,
    required TResult orElse(),
  }) {
    if (insufficientPermission != null) {
      return insufficientPermission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_InsufficientPermission value)
        insufficientPermission,
    required TResult Function(_FirestoreFailure value) firestoreFailure,
    required TResult Function(_NetworkFailure value) networkFailure,
  }) {
    return insufficientPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_InsufficientPermission value)? insufficientPermission,
    TResult? Function(_FirestoreFailure value)? firestoreFailure,
    TResult? Function(_NetworkFailure value)? networkFailure,
  }) {
    return insufficientPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_InsufficientPermission value)? insufficientPermission,
    TResult Function(_FirestoreFailure value)? firestoreFailure,
    TResult Function(_NetworkFailure value)? networkFailure,
    required TResult orElse(),
  }) {
    if (insufficientPermission != null) {
      return insufficientPermission(this);
    }
    return orElse();
  }
}

abstract class _InsufficientPermission implements AppFailures {
  const factory _InsufficientPermission() = _$InsufficientPermissionImpl;
}

/// @nodoc
abstract class _$$FirestoreFailureImplCopyWith<$Res> {
  factory _$$FirestoreFailureImplCopyWith(_$FirestoreFailureImpl value,
          $Res Function(_$FirestoreFailureImpl) then) =
      __$$FirestoreFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FirestoreFailureImplCopyWithImpl<$Res>
    extends _$AppFailuresCopyWithImpl<$Res, _$FirestoreFailureImpl>
    implements _$$FirestoreFailureImplCopyWith<$Res> {
  __$$FirestoreFailureImplCopyWithImpl(_$FirestoreFailureImpl _value,
      $Res Function(_$FirestoreFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FirestoreFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FirestoreFailureImpl implements _FirestoreFailure {
  const _$FirestoreFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AppFailures.firestoreFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirestoreFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirestoreFailureImplCopyWith<_$FirestoreFailureImpl> get copyWith =>
      __$$FirestoreFailureImplCopyWithImpl<_$FirestoreFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function() insufficientPermission,
    required TResult Function(String message) firestoreFailure,
    required TResult Function() networkFailure,
  }) {
    return firestoreFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function()? insufficientPermission,
    TResult? Function(String message)? firestoreFailure,
    TResult? Function()? networkFailure,
  }) {
    return firestoreFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? insufficientPermission,
    TResult Function(String message)? firestoreFailure,
    TResult Function()? networkFailure,
    required TResult orElse(),
  }) {
    if (firestoreFailure != null) {
      return firestoreFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_InsufficientPermission value)
        insufficientPermission,
    required TResult Function(_FirestoreFailure value) firestoreFailure,
    required TResult Function(_NetworkFailure value) networkFailure,
  }) {
    return firestoreFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_InsufficientPermission value)? insufficientPermission,
    TResult? Function(_FirestoreFailure value)? firestoreFailure,
    TResult? Function(_NetworkFailure value)? networkFailure,
  }) {
    return firestoreFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_InsufficientPermission value)? insufficientPermission,
    TResult Function(_FirestoreFailure value)? firestoreFailure,
    TResult Function(_NetworkFailure value)? networkFailure,
    required TResult orElse(),
  }) {
    if (firestoreFailure != null) {
      return firestoreFailure(this);
    }
    return orElse();
  }
}

abstract class _FirestoreFailure implements AppFailures {
  const factory _FirestoreFailure(final String message) =
      _$FirestoreFailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FirestoreFailureImplCopyWith<_$FirestoreFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkFailureImplCopyWith<$Res> {
  factory _$$NetworkFailureImplCopyWith(_$NetworkFailureImpl value,
          $Res Function(_$NetworkFailureImpl) then) =
      __$$NetworkFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NetworkFailureImplCopyWithImpl<$Res>
    extends _$AppFailuresCopyWithImpl<$Res, _$NetworkFailureImpl>
    implements _$$NetworkFailureImplCopyWith<$Res> {
  __$$NetworkFailureImplCopyWithImpl(
      _$NetworkFailureImpl _value, $Res Function(_$NetworkFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NetworkFailureImpl implements _NetworkFailure {
  const _$NetworkFailureImpl();

  @override
  String toString() {
    return 'AppFailures.networkFailure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NetworkFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function() insufficientPermission,
    required TResult Function(String message) firestoreFailure,
    required TResult Function() networkFailure,
  }) {
    return networkFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function()? insufficientPermission,
    TResult? Function(String message)? firestoreFailure,
    TResult? Function()? networkFailure,
  }) {
    return networkFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? insufficientPermission,
    TResult Function(String message)? firestoreFailure,
    TResult Function()? networkFailure,
    required TResult orElse(),
  }) {
    if (networkFailure != null) {
      return networkFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_InsufficientPermission value)
        insufficientPermission,
    required TResult Function(_FirestoreFailure value) firestoreFailure,
    required TResult Function(_NetworkFailure value) networkFailure,
  }) {
    return networkFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_InsufficientPermission value)? insufficientPermission,
    TResult? Function(_FirestoreFailure value)? firestoreFailure,
    TResult? Function(_NetworkFailure value)? networkFailure,
  }) {
    return networkFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_InsufficientPermission value)? insufficientPermission,
    TResult Function(_FirestoreFailure value)? firestoreFailure,
    TResult Function(_NetworkFailure value)? networkFailure,
    required TResult orElse(),
  }) {
    if (networkFailure != null) {
      return networkFailure(this);
    }
    return orElse();
  }
}

abstract class _NetworkFailure implements AppFailures {
  const factory _NetworkFailure() = _$NetworkFailureImpl;
}
