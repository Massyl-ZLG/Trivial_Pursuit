import 'package:freezed_annotation/freezed_annotation.dart';

 
part 'trivial_user.freezed.dart';
part 'trivial_user.g.dart';

/// {@template trivial_user}
/// TrivialUser description
/// {@endtemplate}
@freezed
class TrivialUser with _$TrivialUser {
  /// {@macro trivial_user}
  const factory TrivialUser({ 
    required String  email,
    required String  pseudo,
    required int score,
  }) = _TrivialUser;
  
    /// Creates a TrivialUser from Json map
  factory TrivialUser.fromJson(Map<String, dynamic> data) => _$TrivialUserFromJson(data);
}
