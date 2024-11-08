// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apps_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppModel _$AppModelFromJson(Map<String, dynamic> json) => AppModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      version: json['version'] as String? ?? '1.0.0',
      bundle: json['bundleIdentifier'] as String?,
      desc: json['description'] as String?,
      platform: json['platform'] as String? ?? 'mobile',
      status: json['status'] as String? ?? 'draft',
      createat: json['createat'] == null
          ? null
          : DateTime.parse(json['createat'] as String),
      createby: json['createby'] as String? ?? 'system',
      updateat: json['updateat'] == null
          ? null
          : DateTime.parse(json['updateat'] as String),
      updateby: json['updateby'] as String? ?? 'system',
    );

Map<String, dynamic> _$AppModelToJson(AppModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'version': instance.version,
      'bundleIdentifier': instance.bundle,
      'description': instance.desc,
      'platform': instance.platform,
      'status': instance.status,
      'createat': instance.createat?.toIso8601String(),
      'createby': instance.createby,
      'updateat': instance.updateat?.toIso8601String(),
      'updateby': instance.updateby,
    };
