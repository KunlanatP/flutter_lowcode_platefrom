import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:render_engine/render_engine.dart';

final focusState =
    StateNotifierProvider.autoDispose<FocusState, WidgetContext?>((ref) {
  return FocusState();
});

class FocusState extends StateNotifier<WidgetContext?> {
  FocusState() : super(null);

  set widgetContext(WidgetContext? widgetContext) {
    state = widgetContext;
  }

  WidgetContext? get widgetContext {
    return state;
  }

  void clear() {
    state = null;
  }

  void refresh() {
    state = state?.copyWith();
  }

  @override
  void dispose() {
    state = null;
    super.dispose();
  }
}
