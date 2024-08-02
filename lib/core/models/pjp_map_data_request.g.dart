// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pjp_map_data_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PjpMapDataRequestModel _$PjpMapDataRequestModelFromJson(
        Map<String, dynamic> json) =>
    PjpMapDataRequestModel(
      addingJourney: json['addingJourney'] as bool,
      addingUnplanned: json['addingUnplanned'] as bool,
      bData: json['bdate'] as String,
      refreshing: json['refreshing'] as bool,
    );

Map<String, dynamic> _$PjpMapDataRequestModelToJson(
        PjpMapDataRequestModel instance) =>
    <String, dynamic>{
      'bdate': instance.bData,
      'refreshing': instance.refreshing,
      'addingJourney': instance.addingJourney,
      'addingUnplanned': instance.addingUnplanned,
    };
