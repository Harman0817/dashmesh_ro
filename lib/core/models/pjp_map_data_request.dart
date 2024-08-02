import 'package:json_annotation/json_annotation.dart';
part 'pjp_map_data_request.g.dart';

@JsonSerializable()
class PjpMapDataRequestModel {
  @JsonKey(name: 'bdate')
  final String bData;
  @JsonKey(name: 'refreshing')
  final bool refreshing;
  @JsonKey(name: 'addingJourney')
  final bool addingJourney;
  @JsonKey(name: 'addingUnplanned')
  final bool addingUnplanned;

  PjpMapDataRequestModel({required this.addingJourney, required this.addingUnplanned, required this.bData, required this.refreshing});

  factory PjpMapDataRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PjpMapDataRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$PjpMapDataRequestModelToJson(this);
}
