import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:render_engine/render_engine.dart';

typedef BoxRectQueue = List<WidgetContext>;

final hoverState =
    StateNotifierProvider.autoDispose<HoverState, BoxRectQueue>((ref) {
  return HoverState();
});

class HoverState extends StateNotifier<BoxRectQueue> {
  HoverState() : super([]);

  void addHover(WidgetContext boxRect) {
    state = [...state, boxRect];
  }

  void removeHover(WidgetContext boxRect) {
    state = [
      for (final item in state)
        if (item != boxRect) item,
    ];
  }

  void clear() {
    state = [];
  }

  @override
  void dispose() {
    state = [];
    super.dispose();
  }
}
