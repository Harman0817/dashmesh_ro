// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_unvisited_counter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUnvisitedCounterResponse _$GetUnvisitedCounterResponseFromJson(
        Map<String, dynamic> json) =>
    GetUnvisitedCounterResponse(
      respBody: json['resp_body'] == null
          ? null
          : RespBody.fromJson(json['resp_body'] as Map<String, dynamic>),
      respCode: json['resp_code'] as String?,
      respMsg: json['resp_msg'] as String?,
    );

Map<String, dynamic> _$GetUnvisitedCounterResponseToJson(
        GetUnvisitedCounterResponse instance) =>
    <String, dynamic>{
      'resp_code': instance.respCode,
      'resp_msg': instance.respMsg,
      'resp_body': instance.respBody,
    };

RespBody _$RespBodyFromJson(Map<String, dynamic> json) => RespBody(
      totalCount: (json['totalCount'] as num?)?.toInt(),
      counters: (json['counters'] as List<dynamic>?)
          ?.map((e) => Summary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RespBodyToJson(RespBody instance) => <String, dynamic>{
      'totalCount': instance.totalCount,
      'counters': instance.counters,
    };

Summary _$SummaryFromJson(Map<String, dynamic> json) => Summary(
      counterId: json['counterId'] as String?,
      counterName: json['counterName'] as String?,
      category: json['category'] as String?,
      lastVisited: json['lastVisited'] as String?,
      lastBilled: json['lastBilled'] as String?,
    );

Map<String, dynamic> _$SummaryToJson(Summary instance) => <String, dynamic>{
      'counterId': instance.counterId,
      'counterName': instance.counterName,
      'category': instance.category,
      'lastVisited': instance.lastVisited,
      'lastBilled': instance.lastBilled,
    };
