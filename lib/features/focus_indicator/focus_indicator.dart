import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lowcode_plateform/fonts/fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:render_engine/render_engine.dart';

import '../../states/canvas/canvas_controller.dart';
import '../../states/canvas/canvas_edit_model.dart';
import 'focus_state.dart';

const _kBorder = 2.0;

class FocusIndicator extends ConsumerStatefulWidget {
  const FocusIndicator({
    super.key,
    required this.refKey,
    required this.zoomLevel,
  });

  final GlobalKey refKey;
  final double zoomLevel;

  @override
  ConsumerState<FocusIndicator> createState() => _FocusIndicatorState();
}

class _FocusIndicatorState extends ConsumerState<FocusIndicator> {
  bool _colorStart = false;
  bool _colorPrev = false;
  bool _colorNext = false;
  bool _colorEnd = false;

  @override
  Widget build(BuildContext context) {
    final focus = ref.watch(focusState);
    if (focus == null) return const SizedBox.shrink();

    final rect = widget.refKey.currentContext?.getClientRect();
    final clientRect = focus.getClientRect();
    if (clientRect == null || rect == null) return const SizedBox.shrink();

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          _buildFocusBox(clientRect, rect, focus),
          _buildTitleBar(clientRect, rect, focus),
        ],
      ),
    );
  }

  Widget _buildFocusBox(Rect clientRect, Rect rect, WidgetContext focus) {
    final height = focus.type == 'modal'
        ? (_kBorder / 2) + clientRect.height / 2
        : (_kBorder / 2) + clientRect.height;

    final top = focus.type == 'modal'
        ? (-(_kBorder / 2) + clientRect.top - rect.top) / widget.zoomLevel +
            height
        : (-(_kBorder / 2) + clientRect.top - rect.top) / widget.zoomLevel;

    return Positioned(
      width: (_kBorder / 2) + clientRect.width,
      height: height,
      left: (-(_kBorder / 2) + clientRect.left - rect.left) / widget.zoomLevel,
      top: top,
      child: IgnorePointer(
        ignoring: true,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(width: _kBorder, color: Colors.cyanAccent),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleBar(Rect clientRect, Rect rect, WidgetContext focus) {
    final data = ref.watch(canvasNotifier);
    final parentFocus = getWidgetFromPath(data.value!, focus.path);
    final state = focus.widgetData['props']?['state']?['id'];

    final top = focus.type == 'modal'
        ? (clientRect.top - rect.top - 25) / widget.zoomLevel +
            (_kBorder / 2) +
            clientRect.height / 2
        : (clientRect.top - rect.top - 25) / widget.zoomLevel;

    return Positioned(
      left: (-(_kBorder / 2) + clientRect.left - rect.left) / widget.zoomLevel,
      top: top,
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: Colors.black.withAlpha(180),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(focus.title, style: const TextStyle(color: Colors.white)),
            const SizedBox(width: 10),
            _buildNavigationButtons(focus, parentFocus),
            if (state != null)
              const Icon(
                FluentIcons.database_link_20_filled,
                color: Colors.green,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButtons(WidgetContext focus, dynamic parentFocus) {
    return Row(
      children: [
        _buildNavButton(
          icon: UiIcons.chevron_double_left,
          tooltip: 'Start',
          isHovered: _colorStart,
          onHover: (value) => setState(() => _colorStart = value),
          onTap: () => _moveWidget(focus, parentFocus, 0),
        ),
        _buildNavButton(
          icon: UiIcons.chevron_left,
          tooltip: 'Prev',
          isHovered: _colorPrev,
          onHover: (value) => setState(() => _colorPrev = value),
          onTap: () => _moveWidget(focus, parentFocus, -1),
        ),
        _buildNavButton(
          icon: UiIcons.chevron_right,
          tooltip: 'Next',
          isHovered: _colorNext,
          onHover: (value) => setState(() => _colorNext = value),
          onTap: () => _moveWidget(focus, parentFocus, 1),
        ),
        _buildNavButton(
          icon: UiIcons.chevron_double_right,
          tooltip: 'End',
          isHovered: _colorEnd,
          onHover: (value) => setState(() => _colorEnd = value),
          onTap: () => _moveWidget(focus, parentFocus, null),
        ),
      ],
    );
  }

  Widget _buildNavButton({
    required IconData icon,
    required String tooltip,
    required bool isHovered,
    required Function(bool) onHover,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onHover: onHover,
      onTap: onTap,
      child: Tooltip(
        message: tooltip,
        child: Icon(
          icon,
          color: isHovered ? Colors.lightBlue : Colors.white,
          size: 15,
        ),
      ),
    );
  }

  void _moveWidget(
      WidgetContext focus, dynamic parentFocus, int? offset) async {
    final pathSplit = focus.path.toString().split('/');
    final pathCheck = focus.path[focus.path.length - 2];
    final path = pathCheck == '/'
        ? focus.path.substring(0, focus.path.length - 2)
        : focus.path.substring(0, focus.path.length - 3);

    final currentIndex = pathCheck == '/'
        ? int.parse(pathSplit[pathSplit.length - 1])
        : int.parse(pathSplit[pathSplit.length - 2]);

    int targetIndex;
    if (offset == null) {
      targetIndex = parentFocus.length - 1;
    } else if (offset == 0) {
      targetIndex = 0;
    } else {
      targetIndex = currentIndex + offset;
    }

    if (targetIndex >= 0 && targetIndex < parentFocus.length) {
      await ref.read(canvasController).moveWidget(
            MoveWidgetAction(
              from: focus.path,
              path: '$path/$targetIndex',
              op: Operation.move,
            ),
          );
    }
  }

  dynamic getWidgetFromPath(Map<String, dynamic> map, String path) {
    final index = path.split('/');
    dynamic data = index.isEmpty
        ? map['body']
        : (index.length > 1 && index[1] == 'appBar'
            ? map['appBar']
            : map['body']);

    for (var i = 1; i < index.length - 2; i++) {
      data = data[isNumeric(index[i + 1])
          ? int.parse(index[i + 1])
          : index[i + 1].toString()];
    }
    return data;
  }

  bool isNumeric(String? s) {
    if (s == null) return false;
    return double.tryParse(s) != null;
  }
}
