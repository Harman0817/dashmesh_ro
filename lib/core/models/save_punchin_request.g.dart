// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_punchin_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavePunchinRequestModel _$SavePunchinRequestModelFromJson(
        Map<String, dynamic> json) =>
    SavePunchinRequestModel(
      punchInTime: json['punchInTime'] as String,
      worklocation: json['worklocation'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );

Map<String, dynamic> _$SavePunchinRequestModelToJson(
        SavePunchinRequestModel instance) =>
    <String, dynamic>{
      'punchInTime': instance.punchInTime,
      'worklocation': instance.worklocation,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
