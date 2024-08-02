// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_dealer_pjp_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDealerPjpSummaryResponse _$GetDealerPjpSummaryResponseFromJson(
        Map<String, dynamic> json) =>
    GetDealerPjpSummaryResponse(
      respBody: json['resp_body'] == null
          ? null
          : RespBody.fromJson(json['resp_body'] as Map<String, dynamic>),
      respCode: json['resp_code'] as String?,
      respMsg: json['resp_msg'] as String?,
    );

Map<String, dynamic> _$GetDealerPjpSummaryResponseToJson(
        GetDealerPjpSummaryResponse instance) =>
    <String, dynamic>{
      'resp_code': instance.respCode,
      'resp_msg': instance.respMsg,
      'resp_body': instance.respBody,
    };

RespBody _$RespBodyFromJson(Map<String, dynamic> json) => RespBody(
      summaryList: (json['summaryList'] as List<dynamic>?)
          ?.map((e) => Summary.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPlanned: json['totalPlanned'] as String?,
      totalUnplanned: json['totalUnplanned'] as String?,
    );

Map<String, dynamic> _$RespBodyToJson(RespBody instance) => <String, dynamic>{
      'summaryList': instance.summaryList,
      'totalPlanned': instance.totalPlanned,
      'totalUnplanned': instance.totalUnplanned,
    };

Summary _$SummaryFromJson(Map<String, dynamic> json) => Summary(
      dealerId: json['dealerId'] as String?,
      dealerName: json['dealerName'] as String?,
      poName: json['poName'] as String?,
      pincode: json['pincode'] as String?,
      planned: json['planned'] as String?,
      unplanned: json['unplanned'] as String?,
    );

Map<String, dynamic> _$SummaryToJson(Summary instance) => <String, dynamic>{
      'dealerId': instance.dealerId,
      'dealerName': instance.dealerName,
      'poName': instance.poName,
      'pincode': instance.pincode,
      'planned': instance.planned,
      'unplanned': instance.unplanned,
    };
