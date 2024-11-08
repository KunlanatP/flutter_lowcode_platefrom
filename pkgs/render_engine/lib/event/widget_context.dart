import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:render_engine/event/widget_info.dart';
import 'package:render_engine/widget/toolkit.dart';

/// Calculated from start render offset of Stack Widget
const kStackOffset = Offset(-328, -48);

extension GetClientRect on BuildContext {
  Rect getClientRect([Offset offset = Offset.zero]) {
    final box = findRenderObject() as RenderBox;
    final pos = box.localToGlobal(kStackOffset);
    return Rect(
      width: box.size.width,
      height: box.size.height,
      top: pos.dy,
      left: pos.dx,
    );
  }
}

typedef WidgetData = Map<String, dynamic>;

class WidgetContext {
  final BuildContext context;
  final String path;
  final WidgetData widgetData;
  final String group;

  const WidgetContext({
    required this.context,
    required this.path,
    required this.widgetData,
    required this.group,
  });

  Rect? getClientRect() {
    return context.getClientRect();
  }

  WidgetProps props() {
    return widgetData['props'];
  }

  String? prop(String key) {
    if (props().containsKey(key)) {
      return '${props()[key]}';
    }
    return null;
  }

  WidgetProps? actions() {
    return widgetData['actions'];
  }

  String? action(String key) {
    if (actions()!.containsKey(key)) {
      return '${actions()?[key]}';
    }
    return null;
  }

  String get type {
    assert(widgetData['type'] != null, 'widget type should not be null');
    return widgetData['type'];
  }

  String get id {
    assert(widgetData['id'] != null, 'widget id should not be null');
    return widgetData['id'];
  }

  String get title {
    assert(widgetData['title'] != null, 'widget title should not be null');
    return widgetData['title'];
  }

  Map<String, dynamic> get child {
    return widgetData['child'];
  }

  bool hasChild() {
    return widgetData['child'] != null;
  }

  bool hasBody() {
    return widgetData['body'] != null;
  }

  bool hasChildren() {
    return widgetData['children'] != null;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WidgetContext &&
        other.context == context &&
        other.path == path &&
        mapEquals(other.widgetData, widgetData);
  }

  @override
  int get hashCode => context.hashCode ^ path.hashCode ^ widgetData.hashCode;

  WidgetContext copyWith({
    BuildContext? context,
    String? path,
    WidgetData? widgetData,
    String? group,
  }) {
    return WidgetContext(
      context: context ?? this.context,
      path: path ?? this.path,
      widgetData: widgetData ?? this.widgetData,
      group: group ?? this.group,
    );
  }

  @override
  String toString() {
    return 'WidgetContext(context: $context, path: $path, widgetData: $widgetData, group: $group)';
  }
}
