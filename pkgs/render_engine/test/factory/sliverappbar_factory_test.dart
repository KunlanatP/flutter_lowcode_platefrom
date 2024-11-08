import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:render_engine/engine/engine.dart';

void main() async {
  final widgetData = <String, dynamic>{
    'id': '1',
    'type': 'sliverAppBar',
    'props': {
      'title': {
        'id': '2',
        'type': 'text',
        'props': {
          'data': 'Hello, SliverAppBar',
          'softWrap': true,
          'maxLines': '1',
          'textAlign': 'left',
          'style': {
            'fontSize': 34,
            'fontWeight': 'w900',
            'letterSpacing': 0.25,
            'fontStyle': 'normal',
            'decoration': 'none',
          },
          'colorTheme': {
            'color': '#FFFFFFFF',
          }
        }
      },
    }
  };

  testWidgets("test sliverAppbar factory", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [WidgetFactory.build(context, widget: widgetData)!],
            ),
          );
        },
      ),
    ));

    final appbar = find.byType(SliverAppBar);
    expect(appbar, findsOneWidget);

    final text = find.text("Hello, SliverAppBar");
    expect(text, findsOneWidget);
  });
}
