// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'question_firebase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionFirebase _$QuestionFirebaseFromJson(Map<String, dynamic> json) {
  return _QuestionFirebase.fromJson(json);
}

/// @nodoc
mixin _$QuestionFirebase {
  List<Question> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionFirebaseCopyWith<QuestionFirebase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionFirebaseCopyWith<$Res> {
  factory $QuestionFirebaseCopyWith(
          QuestionFirebase value, $Res Function(QuestionFirebase) then) =
      _$QuestionFirebaseCopyWithImpl<$Res>;
  $Res call({List<Question> results});
}

/// @nodoc
class _$QuestionFirebaseCopyWithImpl<$Res>
    implements $QuestionFirebaseCopyWith<$Res> {
  _$QuestionFirebaseCopyWithImpl(this._value, this._then);

  final QuestionFirebase _value;
  // ignore: unused_field
  final $Res Function(QuestionFirebase) _then;

  @override
  $Res call({
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ));
  }
}

/// @nodoc
abstract class _$$_QuestionFirebaseCopyWith<$Res>
    implements $QuestionFirebaseCopyWith<$Res> {
  factory _$$_QuestionFirebaseCopyWith(
          _$_QuestionFirebase value, $Res Function(_$_QuestionFirebase) then) =
      __$$_QuestionFirebaseCopyWithImpl<$Res>;
  @override
  $Res call({List<Question> results});
}

/// @nodoc
class __$$_QuestionFirebaseCopyWithImpl<$Res>
    extends _$QuestionFirebaseCopyWithImpl<$Res>
    implements _$$_QuestionFirebaseCopyWith<$Res> {
  __$$_QuestionFirebaseCopyWithImpl(
      _$_QuestionFirebase _value, $Res Function(_$_QuestionFirebase) _then)
      : super(_value, (v) => _then(v as _$_QuestionFirebase));

  @override
  _$_QuestionFirebase get _value => super._value as _$_QuestionFirebase;

  @override
  $Res call({
    Object? results = freezed,
  }) {
    return _then(_$_QuestionFirebase(
      results: results == freezed
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionFirebase implements _QuestionFirebase {
  const _$_QuestionFirebase({required final List<Question> results})
      : _results = results;

  factory _$_QuestionFirebase.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionFirebaseFromJson(json);

  final List<Question> _results;
  @override
  List<Question> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'QuestionFirebase(results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionFirebase &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  _$$_QuestionFirebaseCopyWith<_$_QuestionFirebase> get copyWith =>
      __$$_QuestionFirebaseCopyWithImpl<_$_QuestionFirebase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionFirebaseToJson(
      this,
    );
  }
}

abstract class _QuestionFirebase implements QuestionFirebase {
  const factory _QuestionFirebase({required final List<Question> results}) =
      _$_QuestionFirebase;

  factory _QuestionFirebase.fromJson(Map<String, dynamic> json) =
      _$_QuestionFirebase.fromJson;

  @override
  List<Question> get results;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionFirebaseCopyWith<_$_QuestionFirebase> get copyWith =>
      throw _privateConstructorUsedError;
}
