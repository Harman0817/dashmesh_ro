import 'package:json_annotation/json_annotation.dart';
part 'get_unvisited_counter_response.g.dart';
@JsonSerializable()
class GetUnvisitedCounterResponse{
  @JsonKey(name:'resp_code')
  String? respCode;
  @JsonKey(name:'resp_msg')
  String? respMsg;
  @JsonKey(name:'resp_body')
  RespBody? respBody;
  GetUnvisitedCounterResponse({required this.respBody, required this.respCode, required this.respMsg});

  factory GetUnvisitedCounterResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUnvisitedCounterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetUnvisitedCounterResponseToJson(this);
}

@JsonSerializable()
class RespBody{
  @JsonKey(name:'totalCount')
  int? totalCount;
  @JsonKey(name:'counters')
  List<Summary>? counters;
  RespBody({required this.totalCount, required this.counters,});

  factory RespBody.fromJson(Map<String, dynamic> json) =>
      _$RespBodyFromJson(json);
  Map<String, dynamic> toJson() => _$RespBodyToJson(this);
}
@JsonSerializable()
class Summary{
  @JsonKey(name:'counterId')
  String? counterId;
  @JsonKey(name:'counterName')
  String? counterName;
  @JsonKey(name:'category')
  String? category;
  @JsonKey(name:'lastVisited')
  String? lastVisited;
  @JsonKey(name:'lastBilled')
  String? lastBilled;

  Summary({required this.counterId, required this.counterName, required this.category,required this.lastVisited,required this.lastBilled });

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);
  Map<String, dynamic> toJson() => _$SummaryToJson(this);
}