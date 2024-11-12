// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'query.g.dart';

@JsonSerializable()
class QueryByApp {
  @JsonKey(name: 'app')
  final String appId;
  QueryByApp({
    required this.appId,
  });

  factory QueryByApp.fromJson(Map<String, dynamic> json) =>
      _$QueryByAppFromJson(json);
  Map<String, dynamic> toJson() => _$QueryByAppToJson(this);
}

@JsonSerializable()
class QueryFile {
  String? app;
  String? search;
  QueryFile({
    this.app,
    this.search,
  });

  factory QueryFile.fromJson(Map<String, dynamic> json) =>
      _$QueryFileFromJson(json);
  Map<String, dynamic> toJson() => _$QueryFileToJson(this);
}

@JsonSerializable()
class QueryFileAndApp {
  String? app;
  String? fid;
  QueryFileAndApp({
    this.app,
    this.fid,
  });

  factory QueryFileAndApp.fromJson(Map<String, dynamic> json) =>
      _$QueryFileAndAppFromJson(json);
  Map<String, dynamic> toJson() => _$QueryFileAndAppToJson(this);
}
