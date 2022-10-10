// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'trivial_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrivialUser _$TrivialUserFromJson(Map<String, dynamic> json) {
  return _TrivialUser.fromJson(json);
}

/// @nodoc
mixin _$TrivialUser {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrivialUserCopyWith<TrivialUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrivialUserCopyWith<$Res> {
  factory $TrivialUserCopyWith(
          TrivialUser value, $Res Function(TrivialUser) then) =
      _$TrivialUserCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$TrivialUserCopyWithImpl<$Res> implements $TrivialUserCopyWith<$Res> {
  _$TrivialUserCopyWithImpl(this._value, this._then);

  final TrivialUser _value;
  // ignore: unused_field
  final $Res Function(TrivialUser) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TrivialUserCopyWith<$Res>
    implements $TrivialUserCopyWith<$Res> {
  factory _$$_TrivialUserCopyWith(
          _$_TrivialUser value, $Res Function(_$_TrivialUser) then) =
      __$$_TrivialUserCopyWithImpl<$Res>;
  @override
  $Res call({String name});
}

/// @nodoc
class __$$_TrivialUserCopyWithImpl<$Res> extends _$TrivialUserCopyWithImpl<$Res>
    implements _$$_TrivialUserCopyWith<$Res> {
  __$$_TrivialUserCopyWithImpl(
      _$_TrivialUser _value, $Res Function(_$_TrivialUser) _then)
      : super(_value, (v) => _then(v as _$_TrivialUser));

  @override
  _$_TrivialUser get _value => super._value as _$_TrivialUser;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$_TrivialUser(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TrivialUser implements _TrivialUser {
  const _$_TrivialUser({required this.name});

  factory _$_TrivialUser.fromJson(Map<String, dynamic> json) =>
      _$$_TrivialUserFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'TrivialUser(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrivialUser &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_TrivialUserCopyWith<_$_TrivialUser> get copyWith =>
      __$$_TrivialUserCopyWithImpl<_$_TrivialUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrivialUserToJson(
      this,
    );
  }
}

abstract class _TrivialUser implements TrivialUser {
  const factory _TrivialUser({required final String name}) = _$_TrivialUser;

  factory _TrivialUser.fromJson(Map<String, dynamic> json) =
      _$_TrivialUser.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_TrivialUserCopyWith<_$_TrivialUser> get copyWith =>
      throw _privateConstructorUsedError;
}
