import 'package:json_annotation/json_annotation.dart';
part 'get_aso_list_response.g.dart';
@JsonSerializable()
class GetAsoListResponse{
  @JsonKey(name:'resp_code')
  String? resp_code;
  @JsonKey(name:'resp_msg')
  String? resp_msg;
  @JsonKey(name:'resp_body')
  String? resp_body;

  GetAsoListResponse({required this.resp_code, required this.resp_msg, required this.resp_body});

  factory GetAsoListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAsoListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetAsoListResponseToJson(this);
}

