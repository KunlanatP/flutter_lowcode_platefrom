import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:render_engine/render_engine.dart';
import 'hover_state.dart';

const _kBorder = 2.0;

class HoverIndicator extends ConsumerWidget {
  const HoverIndicator({
    super.key,
    required this.refKey,
    required this.zoomLevel,
  });

  final GlobalKey refKey;
  final double zoomLevel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hover = ref.watch(hoverState);
    if (hover.isEmpty) return const Zero();

    final rect = refKey.currentContext?.getClientRect();
    final clientRect = hover.last.getClientRect();
    if (clientRect == null || rect == null) return const Zero();

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          _buildHoverBox(clientRect, rect),
        ],
      ),
    );
  }

  Widget _buildHoverBox(Rect clientRect, Rect rect) {
    final height = (_kBorder / 2) + clientRect.height;
    final top = (-(_kBorder / 2) + clientRect.top - rect.top) / zoomLevel;

    return Positioned(
      width: (_kBorder / 2) + clientRect.width,
      height: height,
      left: (-(_kBorder / 2) + clientRect.left - rect.left) / zoomLevel,
      top: top,
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
  const Zero({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
