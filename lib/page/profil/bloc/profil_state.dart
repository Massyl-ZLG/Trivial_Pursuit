import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_flutter/model/trivial_user.dart';
part 'profil_state.freezed.dart';

@freezed
class ProfilState with _$ProfilState{
  const factory ProfilState.init() = Initial;
  const factory ProfilState.loaded(TrivialUser? user) = Loaded;
  const factory ProfilState.edit() = Edit;
  const factory ProfilState.error(String message) = Error;
}