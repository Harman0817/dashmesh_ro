import 'package:json_annotation/json_annotation.dart';
part 'get_dealer_pjp_summary_response.g.dart';

@JsonSerializable()
class GetDealerPjpSummaryResponse{
  @JsonKey(name:'resp_code')
  String? respCode;
  @JsonKey(name:'resp_msg')
  String? respMsg;
  @JsonKey(name:'resp_body')
  RespBody? respBody;
  GetDealerPjpSummaryResponse({required this.respBody, required this.respCode, required this.respMsg});

  factory GetDealerPjpSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDealerPjpSummaryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetDealerPjpSummaryResponseToJson(this);
}

@JsonSerializable()
class RespBody{
  @JsonKey(name:'summaryList')
  List<Summary>? summaryList;
  @JsonKey(name:'totalPlanned')
  String? totalPlanned;
  @JsonKey(name:'totalUnplanned')
  String? totalUnplanned;

  RespBody({required this.summaryList, required this.totalPlanned, required this.totalUnplanned});

  factory RespBody.fromJson(Map<String, dynamic> json) =>
      _$RespBodyFromJson(json);
  Map<String, dynamic> toJson() => _$RespBodyToJson(this);
}

@JsonSerializable()
class Summary{
  @JsonKey(name:'dealerId')
  String? dealerId;
  @JsonKey(name:'dealerName')
  String? dealerName;
  @JsonKey(name:'poName')
  String? poName;
  @JsonKey(name:'pincode')
  String? pincode;
  @JsonKey(name:'planned')
  String? planned;
  @JsonKey(name:'unplanned')
  String? unplanned;

  Summary({required this.dealerId, required this.dealerName, required this.poName,required this.pincode,required this.planned, required this.unplanned, });

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);
  Map<String, dynamic> toJson() => _$SummaryToJson(this);
}