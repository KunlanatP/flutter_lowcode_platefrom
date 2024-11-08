// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable_with_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageableWithSearch _$PageableWithSearchFromJson(Map<String, dynamic> json) =>
    PageableWithSearch(
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      search: json['search'] as String,
    );

Map<String, dynamic> _$PageableWithSearchToJson(PageableWithSearch instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'search': instance.search,
    };

Pagination<T> _$PaginationFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Pagination<T>(
      data: fromJsonT(json['data']),
      total: (json['total'] as num).toInt(),
      size: (json['size'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationToJson<T>(
  Pagination<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
      'total': instance.total,
      'size': instance.size,
    };
