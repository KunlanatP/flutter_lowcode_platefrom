// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_creation_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageCreationState _$PageCreationStateFromJson(Map<String, dynamic> json) =>
    PageCreationState(
      pageName: json['pageName'] as String?,
      selectedPageType:
          json['selectedPageType'] as String? ?? 'StatelessWidget',
      currentStep: (json['currentStep'] as num?)?.toInt() ?? 0,
      selectedTemplate: json['selectedTemplate'] as String? ?? 'Blank',
    );

Map<String, dynamic> _$PageCreationStateToJson(PageCreationState instance) =>
    <String, dynamic>{
      'pageName': instance.pageName,
      'selectedPageType': instance.selectedPageType,
      'currentStep': instance.currentStep,
      'selectedTemplate': instance.selectedTemplate,
    };
