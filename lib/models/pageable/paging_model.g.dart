// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryPaging _$QueryPagingFromJson(Map<String, dynamic> json) => QueryPaging(
      json['search'] as String,
      json['app'] as String,
    );

Map<String, dynamic> _$QueryPagingToJson(QueryPaging instance) =>
    <String, dynamic>{
      'search': instance.search,
      'app': instance.appId,
    };
