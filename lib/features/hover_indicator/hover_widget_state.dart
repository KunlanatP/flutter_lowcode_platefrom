import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef BoxRectQueue = List<bool>;

final hoverWidgetState =
    StateNotifierProvider.autoDispose<HoverState, BoxRectQueue>((ref) {
  return HoverState();
});

class HoverState extends StateNotifier<BoxRectQueue> {
  HoverState() : super([]);

  void addHover(bool boxRect) {
    state = [...state, boxRect];
  }

  void removeHover(bool boxRect) {
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
