import 'package:flutter_riverpod/flutter_riverpod.dart';

final focusWidgetState =
    StateNotifierProvider.autoDispose<FocusWidgetState, bool>((ref) {
  return FocusWidgetState();
});

class FocusWidgetState extends StateNotifier<bool> {
  FocusWidgetState() : super(false);

  set focusWidget(bool focusWidget) {
    state = focusWidget;
  }

  bool get focusWidget {
    return state;
  }

  void clear() {
    state = false;
  }

  @override
  void dispose() {
    state = false;
    super.dispose();
  }
}
