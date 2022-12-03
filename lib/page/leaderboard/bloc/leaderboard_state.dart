import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_flutter/model/trivial_user.dart';
part 'leaderboard_state.freezed.dart';

@freezed
class LeaderboardState with _$LeaderboardState{
  const factory LeaderboardState.init() = Initial;
  const factory LeaderboardState.loaded(List<TrivialUser?> users) = Loaded;
  const factory LeaderboardState.error(String message) = Error;
}
