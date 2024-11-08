import 'package:json_annotation/json_annotation.dart';

part 'apps_model.g.dart';

@JsonSerializable()
class AppModel {
  String? id;
  final String name;
  String? version;
  @JsonKey(name: 'bundleIdentifier')
  String? bundle;

  // details_app
  @JsonKey(name: 'description')
  String? desc;
  String? platform;
  String? status;

  // base model
  DateTime? createat;
  String? createby;
  DateTime? updateat;
  String? updateby;
  

  AppModel({
    required this.id,
    required this.name,
    this.version = '1.0.0',
    required this.bundle,

    // details_app
    required this.desc,
    this.platform = 'mobile',
    this.status = 'draft',

    // base model
    required this.createat,
    this.createby = 'system',
    required this.updateat,
    this.updateby = 'system',
  });

  AppModel.create({
    required this.name,
    this.version = '1.0.0',
    required this.bundle,
    this.desc = 'A new Flutter project.',
    required this.platform,
    this.createby = 'system',
    this.status = 'active',
  });

  AppModel.update({
    required this.name,
    this.version = '1.0.0',
    this.desc,
    this.status,
  });

  AppModel copyWith({
    String? id,
    String? name,
    String? version,
    String? bundle,
    String? desc,
    String? platform,
    String? status,
    DateTime? createat,
    String? createby,
    DateTime? updateat,
    String? updateby,
  }) {
    return AppModel(
      id: id ?? this.id,
      name: name ?? this.name,
      version: version ?? this.version,
      desc: desc ?? this.desc,
      bundle: bundle ?? this.bundle,
      platform: platform ?? this.platform,
      status: status ?? this.status,
      createat: createat ?? this.createat,
      createby: createby ?? this.createby,
      updateat: updateat ?? this.updateat,
      updateby: updateby ?? this.updateby,
    );
  }

  factory AppModel.fromJson(Map<String, dynamic> json) =>
      _$AppModelFromJson(json);
  Map<String, dynamic> toJson() => _$AppModelToJson(this);
}
