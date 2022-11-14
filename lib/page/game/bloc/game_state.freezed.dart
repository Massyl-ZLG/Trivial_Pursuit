// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuestionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<Question> questions) loaded,
    required TResult Function(String answer) answerSelected,
    required TResult Function() goodAnswer,
    required TResult Function() wrongAnswer,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<Question> questions)? loaded,
    TResult Function(String answer)? answerSelected,
    TResult Function()? goodAnswer,
    TResult Function()? wrongAnswer,
    TResult Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<Question> questions)? loaded,
    TResult Function(String answer)? answerSelected,
    TResult Function()? goodAnswer,
    TResult Function()? wrongAnswer,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) init,
    required TResult Function(Loaded value) loaded,
    required TResult Function(AnswerSelected value) answerSelected,
    required TResult Function(GoodAnswer value) goodAnswer,
    required TResult Function(WrongAnswer value) wrongAnswer,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(Loaded value)? loaded,
    TResult Function(AnswerSelected value)? answerSelected,
    TResult Function(GoodAnswer value)? goodAnswer,
    TResult Function(WrongAnswer value)? wrongAnswer,
    TResult Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(Loaded value)? loaded,
    TResult Function(AnswerSelected value)? answerSelected,
    TResult Function(GoodAnswer value)? goodAnswer,
    TResult Function(WrongAnswer value)? wrongAnswer,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionStateCopyWith<$Res> {
  factory $QuestionStateCopyWith(
          QuestionState value, $Res Function(QuestionState) then) =
      _$QuestionStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$QuestionStateCopyWithImpl<$Res>
    implements $QuestionStateCopyWith<$Res> {
  _$QuestionStateCopyWithImpl(this._value, this._then);

  final QuestionState _value;
  // ignore: unused_field
  final $Res Function(QuestionState) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res> extends _$QuestionStateCopyWithImpl<$Res>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, (v) => _then(v as _$Initial));

  @override
  _$Initial get _value => super._value as _$Initial;
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'QuestionState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<Question> questions) loaded,
    required TResult Function(String answer) answerSelected,
    required TResult Function() goodAnswer,
    required TResult Function() wrongAnswer,
    required TResult Function(String message) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<Question> questions)? loaded,
    TResult Function(String answer)? answerSelected,
    TResult Function()? goodAnswer,
    TResult Function()? wrongAnswer,
    TResult Function(String message)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<Question> questions)? loaded,
    TResult Function(String answer)? answerSelected,
    TResult Function()? goodAnswer,
    TResult Function()? wrongAnswer,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) init,
    required TResult Function(Loaded value) loaded,
    required TResult Function(AnswerSelected value) answerSelected,
    required TResult Function(GoodAnswer value) goodAnswer,
    required TResult Function(WrongAnswer value) wrongAnswer,
    required TResult Function(Error value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(Loaded value)? loaded,
    TResult Function(AnswerSelected value)? answerSelected,
    TResult Function(GoodAnswer value)? goodAnswer,
    TResult Function(WrongAnswer value)? wrongAnswer,
    TResult Function(Error value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(Loaded value)? loaded,
    TResult Function(AnswerSelected value)? answerSelected,
    TResult Function(GoodAnswer value)? goodAnswer,
    TResult Function(WrongAnswer value)? wrongAnswer,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Initial implements QuestionState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$LoadedCopyWith<$Res> {
  factory _$$LoadedCopyWith(_$Loaded value, $Res Function(_$Loaded) then) =
      __$$LoadedCopyWithImpl<$Res>;
  $Res call({List<Question> questions});
}

/// @nodoc
class __$$LoadedCopyWithImpl<$Res> extends _$QuestionStateCopyWithImpl<$Res>
    implements _$$LoadedCopyWith<$Res> {
  __$$LoadedCopyWithImpl(_$Loaded _value, $Res Function(_$Loaded) _then)
      : super(_value, (v) => _then(v as _$Loaded));

  @override
  _$Loaded get _value => super._value as _$Loaded;

  @override
  $Res call({
    Object? questions = freezed,
  }) {
    return _then(_$Loaded(
      questions == freezed
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ));
  }
}

/// @nodoc

class _$Loaded implements Loaded {
  const _$Loaded(final List<Question> questions) : _questions = questions;

  final List<Question> _questions;
  @override
  List<Question> get questions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'QuestionState.loaded(questions: $questions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Loaded &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_questions));

  @JsonKey(ignore: true)
  @override
  _$$LoadedCopyWith<_$Loaded> get copyWith =>
      __$$LoadedCopyWithImpl<_$Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<Question> questions) loaded,
    required TResult Function(String answer) answerSelected,
    required TResult Function() goodAnswer,
    required TResult Function() wrongAnswer,
    required TResult Function(String message) error,
  }) {
    return loaded(questions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<Question> questions)? loaded,
    TResult Function(String answer)? answerSelected,
    TResult Function()? goodAnswer,
    TResult Function()? wrongAnswer,
    TResult Function(String message)? error,
  }) {
    return loaded?.call(questions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<Question> questions)? loaded,
    TResult Function(String answer)? answerSelected,
    TResult Function()? goodAnswer,
    TResult Function()? wrongAnswer,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(questions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) init,
    required TResult Function(Loaded value) loaded,
    required TResult Function(AnswerSelected value) answerSelected,
    required TResult Function(GoodAnswer value) goodAnswer,
    required TResult Function(WrongAnswer value) wrongAnswer,
    required TResult Function(Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(Loaded value)? loaded,
    TResult Function(AnswerSelected value)? answerSelected,
    TResult Function(GoodAnswer value)? goodAnswer,
    TResult Function(WrongAnswer value)? wrongAnswer,
    TResult Function(Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(Loaded value)? loaded,
    TResult Function(AnswerSelected value)? answerSelected,
    TResult Function(GoodAnswer value)? goodAnswer,
    TResult Function(WrongAnswer value)? wrongAnswer,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements QuestionState {
  const factory Loaded(final List<Question> questions) = _$Loaded;

  List<Question> get questions;
  @JsonKey(ignore: true)
  _$$LoadedCopyWith<_$Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AnswerSelectedCopyWith<$Res> {
  factory _$$AnswerSelectedCopyWith(
          _$AnswerSelected value, $Res Function(_$AnswerSelected) then) =
      __$$AnswerSelectedCopyWithImpl<$Res>;
  $Res call({String answer});
}

/// @nodoc
class __$$AnswerSelectedCopyWithImpl<$Res>
    extends _$QuestionStateCopyWithImpl<$Res>
    implements _$$AnswerSelectedCopyWith<$Res> {
  __$$AnswerSelectedCopyWithImpl(
      _$AnswerSelected _value, $Res Function(_$AnswerSelected) _then)
      : super(_value, (v) => _then(v as _$AnswerSelected));

  @override
  _$AnswerSelected get _value => super._value as _$AnswerSelected;

  @override
  $Res call({
    Object? answer = freezed,
  }) {
    return _then(_$AnswerSelected(
      answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AnswerSelected implements AnswerSelected {
  const _$AnswerSelected(this.answer);

  @override
  final String answer;

  @override
  String toString() {
    return 'QuestionState.answerSelected(answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerSelected &&
            const DeepCollectionEquality().equals(other.answer, answer));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(answer));

  @JsonKey(ignore: true)
  @override
  _$$AnswerSelectedCopyWith<_$AnswerSelected> get copyWith =>
      __$$AnswerSelectedCopyWithImpl<_$AnswerSelected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<Question> questions) loaded,
    required TResult Function(String answer) answerSelected,
    required TResult Function() goodAnswer,
    required TResult Function() wrongAnswer,
    required TResult Function(String message) error,
  }) {
    return answerSelected(answer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<Question> questions)? loaded,
    TResult Function(String answer)? answerSelected,
    TResult Function()? goodAnswer,
    TResult Function()? wrongAnswer,
    TResult Function(String message)? error,
  }) {
    return answerSelected?.call(answer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<Question> questions)? loaded,
    TResult Function(String answer)? answerSelected,
    TResult Function()? goodAnswer,
    TResult Function()? wrongAnswer,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (answerSelected != null) {
      return answerSelected(answer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) init,
    required TResult Function(Loaded value) loaded,
    required TResult Function(AnswerSelected value) answerSelected,
    required TResult Function(GoodAnswer value) goodAnswer,
    required TResult Function(WrongAnswer value) wrongAnswer,
    required TResult Function(Error value) error,
  }) {
    return answerSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(Loaded value)? loaded,
    TResult Function(AnswerSelected value)? answerSelected,
    TResult Function(GoodAnswer value)? goodAnswer,
    TResult Function(WrongAnswer value)? wrongAnswer,
    TResult Function(Error value)? error,
  }) {
    return answerSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(Loaded value)? loaded,
    TResult Function(AnswerSelected value)? answerSelected,
    TResult Function(GoodAnswer value)? goodAnswer,
    TResult Function(WrongAnswer value)? wrongAnswer,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (answerSelected != null) {
      return answerSelected(this);
    }
    return orElse();
  }
}

abstract class AnswerSelected implements QuestionState {
  const factory AnswerSelected(final String answer) = _$AnswerSelected;

  String get answer;
  @JsonKey(ignore: true)
  _$$AnswerSelectedCopyWith<_$AnswerSelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GoodAnswerCopyWith<$Res> {
  factory _$$GoodAnswerCopyWith(
          _$GoodAnswer value, $Res Function(_$GoodAnswer) then) =
      __$$GoodAnswerCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoodAnswerCopyWithImpl<$Res> extends _$QuestionStateCopyWithImpl<$Res>
    implements _$$GoodAnswerCopyWith<$Res> {
  __$$GoodAnswerCopyWithImpl(
      _$GoodAnswer _value, $Res Function(_$GoodAnswer) _then)
      : super(_value, (v) => _then(v as _$GoodAnswer));

  @override
  _$GoodAnswer get _value => super._value as _$GoodAnswer;
}

/// @nodoc

class _$GoodAnswer implements GoodAnswer {
  const _$GoodAnswer();

  @override
  String toString() {
    return 'QuestionState.goodAnswer()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoodAnswer);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<Question> questions) loaded,
    required TResult Function(String answer) answerSelected,
    required TResult Function() goodAnswer,
    required TResult Function() wrongAnswer,
    required TResult Function(String message) error,
  }) {
    return goodAnswer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<Question> questions)? loaded,
    TResult Function(String answer)? answerSelected,
    TResult Function()? goodAnswer,
    TResult Function()? wrongAnswer,
    TResult Function(String message)? error,
  }) {
    return goodAnswer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<Question> questions)? loaded,
    TResult Function(String answer)? answerSelected,
    TResult Function()? goodAnswer,
    TResult Function()? wrongAnswer,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (goodAnswer != null) {
      return goodAnswer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) init,
    required TResult Function(Loaded value) loaded,
    required TResult Function(AnswerSelected value) answerSelected,
    required TResult Function(GoodAnswer value) goodAnswer,
    required TResult Function(WrongAnswer value) wrongAnswer,
    required TResult Function(Error value) error,
  }) {
    return goodAnswer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(Loaded value)? loaded,
    TResult Function(AnswerSelected value)? answerSelected,
    TResult Function(GoodAnswer value)? goodAnswer,
    TResult Function(WrongAnswer value)? wrongAnswer,
    TResult Function(Error value)? error,
  }) {
    return goodAnswer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(Loaded value)? loaded,
    TResult Function(AnswerSelected value)? answerSelected,
    TResult Function(GoodAnswer value)? goodAnswer,
    TResult Function(WrongAnswer value)? wrongAnswer,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (goodAnswer != null) {
      return goodAnswer(this);
    }
    return orElse();
  }
}

abstract class GoodAnswer implements QuestionState {
  const factory GoodAnswer() = _$GoodAnswer;
}

/// @nodoc
abstract class _$$WrongAnswerCopyWith<$Res> {
  factory _$$WrongAnswerCopyWith(
          _$WrongAnswer value, $Res Function(_$WrongAnswer) then) =
      __$$WrongAnswerCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WrongAnswerCopyWithImpl<$Res>
    extends _$QuestionStateCopyWithImpl<$Res>
    implements _$$WrongAnswerCopyWith<$Res> {
  __$$WrongAnswerCopyWithImpl(
      _$WrongAnswer _value, $Res Function(_$WrongAnswer) _then)
      : super(_value, (v) => _then(v as _$WrongAnswer));

  @override
  _$WrongAnswer get _value => super._value as _$WrongAnswer;
}

/// @nodoc

class _$WrongAnswer implements WrongAnswer {
  const _$WrongAnswer();

  @override
  String toString() {
    return 'QuestionState.wrongAnswer()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WrongAnswer);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<Question> questions) loaded,
    required TResult Function(String answer) answerSelected,
    required TResult Function() goodAnswer,
    required TResult Function() wrongAnswer,
    required TResult Function(String message) error,
  }) {
    return wrongAnswer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<Question> questions)? loaded,
    TResult Function(String answer)? answerSelected,
    TResult Function()? goodAnswer,
    TResult Function()? wrongAnswer,
    TResult Function(String message)? error,
  }) {
    return wrongAnswer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<Question> questions)? loaded,
    TResult Function(String answer)? answerSelected,
    TResult Function()? goodAnswer,
    TResult Function()? wrongAnswer,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (wrongAnswer != null) {
      return wrongAnswer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) init,
    required TResult Function(Loaded value) loaded,
    required TResult Function(AnswerSelected value) answerSelected,
    required TResult Function(GoodAnswer value) goodAnswer,
    required TResult Function(WrongAnswer value) wrongAnswer,
    required TResult Function(Error value) error,
  }) {
    return wrongAnswer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(Loaded value)? loaded,
    TResult Function(AnswerSelected value)? answerSelected,
    TResult Function(GoodAnswer value)? goodAnswer,
    TResult Function(WrongAnswer value)? wrongAnswer,
    TResult Function(Error value)? error,
  }) {
    return wrongAnswer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(Loaded value)? loaded,
    TResult Function(AnswerSelected value)? answerSelected,
    TResult Function(GoodAnswer value)? goodAnswer,
    TResult Function(WrongAnswer value)? wrongAnswer,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (wrongAnswer != null) {
      return wrongAnswer(this);
    }
    return orElse();
  }
}

abstract class WrongAnswer implements QuestionState {
  const factory WrongAnswer() = _$WrongAnswer;
}

/// @nodoc
abstract class _$$ErrorCopyWith<$Res> {
  factory _$$ErrorCopyWith(_$Error value, $Res Function(_$Error) then) =
      __$$ErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$ErrorCopyWithImpl<$Res> extends _$QuestionStateCopyWithImpl<$Res>
    implements _$$ErrorCopyWith<$Res> {
  __$$ErrorCopyWithImpl(_$Error _value, $Res Function(_$Error) _then)
      : super(_value, (v) => _then(v as _$Error));

  @override
  _$Error get _value => super._value as _$Error;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$Error(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Error implements Error {
  const _$Error(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'QuestionState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$ErrorCopyWith<_$Error> get copyWith =>
      __$$ErrorCopyWithImpl<_$Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<Question> questions) loaded,
    required TResult Function(String answer) answerSelected,
    required TResult Function() goodAnswer,
    required TResult Function() wrongAnswer,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<Question> questions)? loaded,
    TResult Function(String answer)? answerSelected,
    TResult Function()? goodAnswer,
    TResult Function()? wrongAnswer,
    TResult Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<Question> questions)? loaded,
    TResult Function(String answer)? answerSelected,
    TResult Function()? goodAnswer,
    TResult Function()? wrongAnswer,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) init,
    required TResult Function(Loaded value) loaded,
    required TResult Function(AnswerSelected value) answerSelected,
    required TResult Function(GoodAnswer value) goodAnswer,
    required TResult Function(WrongAnswer value) wrongAnswer,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(Loaded value)? loaded,
    TResult Function(AnswerSelected value)? answerSelected,
    TResult Function(GoodAnswer value)? goodAnswer,
    TResult Function(WrongAnswer value)? wrongAnswer,
    TResult Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? init,
    TResult Function(Loaded value)? loaded,
    TResult Function(AnswerSelected value)? answerSelected,
    TResult Function(GoodAnswer value)? goodAnswer,
    TResult Function(WrongAnswer value)? wrongAnswer,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements QuestionState {
  const factory Error(final String message) = _$Error;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<_$Error> get copyWith => throw _privateConstructorUsedError;
}
