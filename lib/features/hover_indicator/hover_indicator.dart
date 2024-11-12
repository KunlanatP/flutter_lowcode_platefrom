import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:render_engine/render_engine.dart';

import 'hover_state.dart';

const _kBorder = 2.0;

class HoverIndicator extends ConsumerWidget {
  const HoverIndicator({
    Key? key,
    required this.refKey,
    required this.zoomLevel,
  }) : super(key: key);

  final GlobalKey refKey;
  final double zoomLevel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hover = ref.watch(hoverState);
    if (hover.isEmpty) {
      return const Zero();
    }
    final rect = refKey.currentContext?.getClientRect();
    final clientRect = hover.last.getClientRect();
    if (clientRect == null || rect == null) {
      return const Zero();
    }

    var _height = (_kBorder / 2) + clientRect.height;
    var _top = (-(_kBorder / 2) + clientRect.top - rect.top) / zoomLevel;
    if (hover.last.type == 'modal') {
      _height = _height / 2;
      _top = _top + _height;
    }
    return Positioned(
      width: (_kBorder / 2) + clientRect.width,
      height: _height,
      left: (-(_kBorder / 2) + clientRect.left - rect.left) / zoomLevel,
      top: _top,
      child: IgnorePointer(
        ignoring: true,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              width: _kBorder,
              color: Colors.pinkAccent,
            ),
          ),
        ),
      ),
    );
  }
}

class Zero extends StatelessWidget {
  const Zero({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      width: 0,
      height: 0,
      child: SizedBox.square(dimension: 0),
    );
  }
}
