import 'package:json_annotation/json_annotation.dart';

part 'page_creation_state.g.dart';

@JsonSerializable()
class PageCreationState {
  String? pageName;
  String? selectedPageType;
  int? currentStep;
  String? selectedTemplate;

  PageCreationState({
    this.pageName,
    this.selectedPageType = 'StatelessWidget',
    this.currentStep = 0,
    this.selectedTemplate = 'Blank',
  });

  PageCreationState copyWith({
    String? pageName,
    String? selectedPageType,
    int? currentStep,
    String? selectedTemplate,
  }) {
    return PageCreationState(
      pageName: pageName ?? this.pageName,
      selectedPageType: selectedPageType ?? this.selectedPageType,
      currentStep: currentStep ?? this.currentStep,
      selectedTemplate: selectedTemplate ?? this.selectedTemplate,
    );
  }

  factory PageCreationState.fromJson(Map<String, dynamic> json) =>
      _$PageCreationStateFromJson(json);
  Map<String, dynamic> toJson() => _$PageCreationStateToJson(this);
}
