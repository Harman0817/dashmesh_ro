// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_aso_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAsoListResponse _$GetAsoListResponseFromJson(Map<String, dynamic> json) =>
    GetAsoListResponse(
      resp_code: json['resp_code'] as String?,
      resp_msg: json['resp_msg'] as String?,
      resp_body: json['resp_body'] as String?,
    );

Map<String, dynamic> _$GetAsoListResponseToJson(GetAsoListResponse instance) =>
    <String, dynamic>{
      'resp_code': instance.resp_code,
      'resp_msg': instance.resp_msg,
      'resp_body': instance.resp_body,
    };
