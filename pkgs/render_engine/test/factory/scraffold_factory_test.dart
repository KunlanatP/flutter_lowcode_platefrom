import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:render_engine/render_engine.dart';

void main() async {
  setUpAll(() => {WidgetFactory.ensureInitialized()});
  testWidgets("Scraffold Node Test Suite", (tester) async {
    const sized = Size(380, 720);
    await tester.binding.setSurfaceSize(sized);

    final widgetData = {
      'id': '1',
      'type': 'scaffold',
      'props': {
        'colorTheme': {
          'color': '#FFF4F4F4',
        }
      },
      'body': {
        'id': '2',
        'type': 'text',
        'props': {
          'data': 'Hello, World!',
          'softWrap': true,
          'maxLines': '1',
          'textAlign': 'left',
          'style': {
            'fontFamily': 'Abel',
            'fontSize': 34,
            'fontWeight': 'w400',
            'letterSpacing': 0.25,
            'fontStyle': 'normal',
            'decoration': 'none',
          },
          'colorTheme': {
            'color': '#FF800000',
          }
        }
      }
    };
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) {
          return WidgetFactory.build(context, widget: widgetData)!;
        },
      ),
    ));

    expect(find.byType(Scaffold), findsOneWidget);
  });
}
