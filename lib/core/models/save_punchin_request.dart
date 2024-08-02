import 'package:json_annotation/json_annotation.dart';
part 'save_punchin_request.g.dart';

@JsonSerializable()
class SavePunchinRequestModel {
  @JsonKey(name: 'punchInTime')
  final String punchInTime;
  @JsonKey(name: 'worklocation')
  final String worklocation;
  @JsonKey(name: 'latitude')
  final String latitude;
  @JsonKey(name: 'longitude')
  final String longitude;

  SavePunchinRequestModel({required this.punchInTime, required this.worklocation, required this.latitude, required this.longitude});

  factory SavePunchinRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SavePunchinRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$SavePunchinRequestModelToJson(this);
}