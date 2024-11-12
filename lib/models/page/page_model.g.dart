// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageModel _$PageModelFromJson(Map<String, dynamic> json) => PageModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      appId: json['appId'] as String,
      type: $enumDecode(_$PageTypeEnumMap, json['type']),
      isHome: json['isHome'] as bool?,
      routePath: json['routePath'] as String?,
      template: json['template'] as String?,
    );

Map<String, dynamic> _$PageModelToJson(PageModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'appId': instance.appId,
      'type': _$PageTypeEnumMap[instance.type]!,
      'isHome': instance.isHome,
      'routePath': instance.routePath,
      'template': instance.template,
    };

const _$PageTypeEnumMap = {
  PageType.blank: 'blank',
  PageType.tab: 'tab',
  PageType.modal: 'modal',
  PageType.drawer: 'drawer',
  PageType.simple: 'simple',
};
