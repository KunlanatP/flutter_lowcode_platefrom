// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryByApp _$QueryByAppFromJson(Map<String, dynamic> json) => QueryByApp(
      appId: json['app'] as String,
    );

Map<String, dynamic> _$QueryByAppToJson(QueryByApp instance) =>
    <String, dynamic>{
      'app': instance.appId,
    };

QueryFile _$QueryFileFromJson(Map<String, dynamic> json) => QueryFile(
      app: json['app'] as String?,
      search: json['search'] as String?,
    );

Map<String, dynamic> _$QueryFileToJson(QueryFile instance) => <String, dynamic>{
      'app': instance.app,
      'search': instance.search,
    };

QueryFileAndApp _$QueryFileAndAppFromJson(Map<String, dynamic> json) =>
    QueryFileAndApp(
      app: json['app'] as String?,
      fid: json['fid'] as String?,
    );

Map<String, dynamic> _$QueryFileAndAppToJson(QueryFileAndApp instance) =>
    <String, dynamic>{
      'app': instance.app,
      'fid': instance.fid,
    };
