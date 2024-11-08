import 'package:json_annotation/json_annotation.dart';

part 'status_model.g.dart';

@JsonSerializable()
class StatusModel {
  final String status;

  StatusModel({required this.status});

  factory StatusModel.fromJson(Map<String, dynamic> json) =>
      _$StatusModelFromJson(json);
  Map<String, dynamic> toJson() => _$StatusModelToJson(this);
}
