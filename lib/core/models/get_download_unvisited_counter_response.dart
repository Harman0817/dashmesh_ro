import 'package:json_annotation/json_annotation.dart';
part 'get_download_unvisited_counter_response.g.dart';
@JsonSerializable()
class GetDownloadUnvisitedCounterResponse {
  @JsonKey(name:'resp_code')
  String? resp_code;
  @JsonKey(name:'resp_msg')
  String? resp_msg;
  @JsonKey(name:'resp_body')
  String? resp_body;
  GetDownloadUnvisitedCounterResponse({required this.resp_code, required this.resp_msg, required this.resp_body});

  factory GetDownloadUnvisitedCounterResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDownloadUnvisitedCounterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetDownloadUnvisitedCounterResponseToJson(this);
}