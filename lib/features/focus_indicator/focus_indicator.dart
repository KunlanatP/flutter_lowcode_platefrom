import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lowcode_plateform/fonts/fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:render_engine/render_engine.dart';

import '../../states/canvas/canvas_controller.dart';
import '../../states/canvas/canvas_edit_model.dart';
import '../hover_indicator/hover_indicator.dart';
import 'focus_state.dart';

const _kBorder = 2.0;

class FocusIndicator extends ConsumerStatefulWidget {
  const FocusIndicator({
    Key? key,
    required this.refKey,
    required this.zoomLevel,
  }) : super(key: key);

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

    if (focus == null) {
      return const Zero();
    }
    final rect = widget.refKey.currentContext?.getClientRect();
    final clientRect = focus.getClientRect();
    if (clientRect == null || rect == null) {
      return const Zero();
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        titleWidgetName(
          clientRect: clientRect,
          rect: rect,
          focus: focus,
        ),
        positionWidgetFocus(
          clientRect: clientRect,
          rect: rect,
          focus: focus,
        ),
      ],
    );
  }

  dynamic positionWidgetFocus({
    required Rect clientRect,
    required Rect rect,
    required WidgetContext focus,
  }) {
    var _height = (_kBorder / 2) + clientRect.height;
    var _top = (-(_kBorder / 2) + clientRect.top - rect.top) / widget.zoomLevel;

    if (focus.type == 'modal') {
      _height = (_kBorder / 2) + clientRect.height / 2;
      _top = (-(_kBorder / 2) + clientRect.top - rect.top) / widget.zoomLevel +
          _height;
    }

    return Positioned(
      width: (_kBorder / 2) + clientRect.width,
      height: _height,
      left: (-(_kBorder / 2) + clientRect.left - rect.left) / widget.zoomLevel,
      top: _top,
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

  dynamic titleWidgetName({
    required Rect clientRect,
    required Rect rect,
    required WidgetContext focus,
  }) {
    final data = ref.watch(canvasNotifier);
    final parentFocus = getWidgetFromPath(data.value!, focus.path);
    final state = focus.widgetData['props']?['state']?['id'];

    var _top = (clientRect.top - rect.top - 25) / widget.zoomLevel;

    if (focus.type == 'modal') {
      final _height = (_kBorder / 2) + clientRect.height / 2;
      _top = (clientRect.top - rect.top - 25) / widget.zoomLevel + _height;
    }
    return Positioned(
      left: (-(_kBorder / 2) + clientRect.left - rect.left) / widget.zoomLevel,
      top: _top,
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
            Text(
              focus.title,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(width: 10),
            InkWell(
              onHover: (value) {
                setState(() {
                  _colorStart = value;
                });
              },
              onTap: () async {
                final pathSplit = focus.path.toString().split('/');
                int indexWidget;
                final pathCheck = focus.path[focus.path.length - 2];
                String path;
                if (pathCheck == '/') {
                  path = focus.path.substring(0, focus.path.length - 2);
                  indexWidget = int.parse(pathSplit[pathSplit.length - 1]);
                } else {
                  path = focus.path.substring(0, focus.path.length - 3);
                  indexWidget = int.parse(pathSplit[pathSplit.length - 2]);
                }
                if (indexWidget > 0) {
                  await ref.read(canvasController).moveWidget(
                        MoveWidgetAction(
                            from: focus.path,
                            path: '$path/0',
                            op: Operation.move),
                      );
                }
                _colorStart = false;
              },
              child: Tooltip(
                message: 'Start',
                child: Icon(
                  UiIcons.chevron_double_left,
                  color: _colorStart == true ? Colors.lightBlue : Colors.white,
                  size: 15,
                ),
              ),
            ),
            InkWell(
              onHover: (value) {
                setState(() {
                  _colorPrev = value;
                });
              },
              onTap: () async {
                final pathSplit = focus.path.toString().split('/');
                int indexWidget;
                final pathCheck = focus.path[focus.path.length - 2];
                String path;
                if (pathCheck == '/') {
                  path = focus.path.substring(0, focus.path.length - 2);
                  indexWidget = int.parse(pathSplit[pathSplit.length - 1]);
                } else {
                  path = focus.path.substring(0, focus.path.length - 3);
                  indexWidget = int.parse(pathSplit[pathSplit.length - 2]);
                }
                if (indexWidget - 1 >= 0) {
                  await ref.read(canvasController).moveWidget(
                        MoveWidgetAction(
                            from: focus.path,
                            path: '$path/${indexWidget - 1}',
                            op: Operation.move),
                      );
                }
                _colorPrev = false;
              },
              child: Tooltip(
                message: 'Prev',
                child: Icon(
                  UiIcons.chevron_left,
                  color: _colorPrev == true ? Colors.lightBlue : Colors.white,
                  size: 15,
                ),
              ),
            ),
            InkWell(
              onHover: (value) {
                setState(() {
                  _colorNext = value;
                });
              },
              onTap: () async {
                final pathSplit = focus.path.toString().split('/');
                int indexWidget;
                final pathCheck = focus.path[focus.path.length - 2];
                String path;
                if (pathCheck == '/') {
                  path = focus.path.substring(0, focus.path.length - 2);
                  indexWidget = int.parse(pathSplit[pathSplit.length - 1]);
                } else {
                  path = focus.path.substring(0, focus.path.length - 3);
                  indexWidget = int.parse(pathSplit[pathSplit.length - 2]);
                }
                if (indexWidget + 1 < parentFocus.length) {
                  await ref.read(canvasController).moveWidget(
                        MoveWidgetAction(
                            from: focus.path,
                            path: '$path/${indexWidget + 1}',
                            op: Operation.move),
                      );
                }
                _colorNext = false;
              },
              child: Tooltip(
                message: 'Next',
                child: Icon(
                  UiIcons.chevron_right,
                  color: _colorNext == true ? Colors.lightBlue : Colors.white,
                  size: 15,
                ),
              ),
            ),
            InkWell(
              onHover: (value) {
                setState(() {
                  _colorEnd = value;
                });
              },
              onTap: () async {
                final pathSplit = focus.path.toString().split('/');
                int indexWidget;
                final pathCheck = focus.path[focus.path.length - 2];
                String path;
                if (pathCheck == '/') {
                  path = focus.path.substring(0, focus.path.length - 2);
                  indexWidget = int.parse(pathSplit[pathSplit.length - 1]);
                } else {
                  path = focus.path.substring(0, focus.path.length - 3);
                  indexWidget = int.parse(pathSplit[pathSplit.length - 2]);
                }
                if (indexWidget < parentFocus.length - 1) {
                  await ref.read(canvasController).moveWidget(
                        MoveWidgetAction(
                            from: focus.path,
                            path: '$path/${parentFocus.length - 1}',
                            op: Operation.move),
                      );
                }
                _colorEnd = false;
              },
              child: Tooltip(
                message: 'End',
                child: Icon(
                  UiIcons.chevron_double_right,
                  color: _colorEnd == true ? Colors.lightBlue : Colors.white,
                  size: 15,
                ),
              ),
            ),
            const SizedBox(width: 10),
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
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
