// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'canvas_edit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditPropsAction _$EditPropsActionFromJson(Map<String, dynamic> json) =>
    EditPropsAction(
      path: json['path'] as String,
      value: json['value'],
      op: $enumDecode(_$OperationEnumMap, json['op']),
    );

Map<String, dynamic> _$EditPropsActionToJson(EditPropsAction instance) =>
    <String, dynamic>{
      'path': instance.path,
      'value': instance.value,
      'op': _$OperationEnumMap[instance.op]!,
    };

const _$OperationEnumMap = {
  Operation.replace: 'replace',
  Operation.add: 'add',
  Operation.remove: 'remove',
  Operation.copy: 'copy',
  Operation.move: 'move',
  Operation.test: 'test',
};

EditWidgetAction _$EditWidgetActionFromJson(Map<String, dynamic> json) =>
    EditWidgetAction(
      path: json['path'] as String,
      value: json['value'] as Map<String, dynamic>?,
      op: $enumDecode(_$OperationEnumMap, json['op']),
    );

Map<String, dynamic> _$EditWidgetActionToJson(EditWidgetAction instance) =>
    <String, dynamic>{
      'path': instance.path,
      'value': instance.value,
      'op': _$OperationEnumMap[instance.op]!,
    };

MoveWidgetAction _$MoveWidgetActionFromJson(Map<String, dynamic> json) =>
    MoveWidgetAction(
      path: json['path'] as String,
      from: json['from'] as String,
      op: $enumDecode(_$OperationEnumMap, json['op']),
    );

Map<String, dynamic> _$MoveWidgetActionToJson(MoveWidgetAction instance) =>
    <String, dynamic>{
      'path': instance.path,
      'from': instance.from,
      'op': _$OperationEnumMap[instance.op]!,
    };
