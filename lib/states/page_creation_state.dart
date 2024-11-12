import 'package:flutter_lowcode_plateform/models/page/page_creation_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

AutoDisposeStateProvider<PageCreationState> pageCreationState =
    StateProvider.autoDispose<PageCreationState>((ref) {
  return PageCreationState(
    currentStep: 0,
    pageName: '',
    selectedPageType: 'StatelessWidget',
    selectedTemplate: 'Blank',
  );
});
