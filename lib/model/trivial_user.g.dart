// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trivial_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TrivialUser _$$_TrivialUserFromJson(Map<String, dynamic> json) =>
    _$_TrivialUser(
      pseudo: json['pseudo'] as String?,
      score: json['score'] as int,
      played_at: json['played_at'] as String?,
    );

Map<String, dynamic> _$$_TrivialUserToJson(_$_TrivialUser instance) =>
    <String, dynamic>{
      'pseudo': instance.pseudo,
      'score': instance.score,
      'played_at': instance.played_at,
    };
