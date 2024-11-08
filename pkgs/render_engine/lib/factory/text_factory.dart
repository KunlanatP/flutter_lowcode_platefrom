import 'package:flutter/material.dart';
import 'package:render_engine/engine/engine.dart';
import 'package:render_engine/factory/factory.dart';
import 'package:uuid/uuid.dart';

class TextFactory extends Factory<Text> {
  @override
  Widget? build(
    BuildContext context, {
    WidgetData? widget,
    String? path,
    Options? options,
    String? appID,
    String? themeMode,
  }) {
    final props = widget?['props'];
    String data = '${props?['data']}';

    Widget child = Text(data);

    return child;
  }

  @override
  Map<String, dynamic>? export(BuildContext context, Text widget) {
    return {
      'type': name,
      'props': {
        'data': widget.data,
        'softWrap': widget.softWrap,
        'maxLines': widget.maxLines,
        'overflow': widget.overflow,
        'textAlign': widget.textAlign,
        'style': widget.style,
        'alignment': Alignment,
        'padding': EdgeInsets,
      }
    };
  }

  @override
  Map<String, dynamic> template() {
    return <String, dynamic>{
      'id': const Uuid().v4(),
      'type': name,
      'title': name,
      'props': {
        'data': 'Text Widget',
        'softWrap': true,
        'maxLines': '1',
        'style': {
          'fontFamily': 'Roboto',
          'fontSize': 14.0,
          'fontWeight': 'w400',
          'letterSpacing': 0.3,
          'fontStyle': 'normal',
          'decoration': 'none',
          'colorTheme': '#FF323232',
        },
        'textAlign': 'left',
      },
    };
  }

  @override
  String get name => 'text';

  @override
  Type get type => Text;

  @override
  String get group => 'leaf';
}
