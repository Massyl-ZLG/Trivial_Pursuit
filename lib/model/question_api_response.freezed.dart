// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'question_api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionApiResponse _$QuestionApiResponseFromJson(Map<String, dynamic> json) {
  return _QuestionApiResponse.fromJson(json);
}

/// @nodoc
mixin _$QuestionApiResponse {
  List<Question> get results => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionApiResponseCopyWith<QuestionApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionApiResponseCopyWith<$Res> {
  factory $QuestionApiResponseCopyWith(
          QuestionApiResponse value, $Res Function(QuestionApiResponse) then) =
      _$QuestionApiResponseCopyWithImpl<$Res>;
  $Res call({List<Question> results, String date});
}

/// @nodoc
class _$QuestionApiResponseCopyWithImpl<$Res>
    implements $QuestionApiResponseCopyWith<$Res> {
  _$QuestionApiResponseCopyWithImpl(this._value, this._then);

  final QuestionApiResponse _value;
  // ignore: unused_field
  final $Res Function(QuestionApiResponse) _then;

  @override
  $Res call({
    Object? results = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_QuestionApiResponseCopyWith<$Res>
    implements $QuestionApiResponseCopyWith<$Res> {
  factory _$$_QuestionApiResponseCopyWith(_$_QuestionApiResponse value,
          $Res Function(_$_QuestionApiResponse) then) =
      __$$_QuestionApiResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<Question> results, String date});
}

/// @nodoc
class __$$_QuestionApiResponseCopyWithImpl<$Res>
    extends _$QuestionApiResponseCopyWithImpl<$Res>
    implements _$$_QuestionApiResponseCopyWith<$Res> {
  __$$_QuestionApiResponseCopyWithImpl(_$_QuestionApiResponse _value,
      $Res Function(_$_QuestionApiResponse) _then)
      : super(_value, (v) => _then(v as _$_QuestionApiResponse));

  @override
  _$_QuestionApiResponse get _value => super._value as _$_QuestionApiResponse;

  @override
  $Res call({
    Object? results = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_QuestionApiResponse(
      results: results == freezed
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionApiResponse implements _QuestionApiResponse {
  const _$_QuestionApiResponse(
      {required final List<Question> results, required this.date})
      : _results = results;

  factory _$_QuestionApiResponse.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionApiResponseFromJson(json);

  final List<Question> _results;
  @override
  List<Question> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final String date;

  @override
  String toString() {
    return 'QuestionApiResponse(results: $results, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionApiResponse &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_results),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_QuestionApiResponseCopyWith<_$_QuestionApiResponse> get copyWith =>
      __$$_QuestionApiResponseCopyWithImpl<_$_QuestionApiResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionApiResponseToJson(
      this,
    );
  }
}

abstract class _QuestionApiResponse implements QuestionApiResponse {
  const factory _QuestionApiResponse(
      {required final List<Question> results,
      required final String date}) = _$_QuestionApiResponse;

  factory _QuestionApiResponse.fromJson(Map<String, dynamic> json) =
      _$_QuestionApiResponse.fromJson;

  @override
  List<Question> get results;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionApiResponseCopyWith<_$_QuestionApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
