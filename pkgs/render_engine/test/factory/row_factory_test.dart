import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:render_engine/render_engine.dart';

void main() {
  group("Test Node Row:", () {
    setUpAll(() => {WidgetFactory.ensureInitialized()});

    testWidgets("should render without error", (tester) async {
      const sized = Size(380, 720);
      await tester.binding.setSurfaceSize(sized);

      final widgetData = <String, dynamic>{
        'id': '1',
        'type': 'row',
        'props': {
          'crossAxis': 'center',
          'mainAxis': 'start',
          'mainAxisSize': 'max',
          'scrolling': false,
        },
        'children': [
          {
            'id': '2',
            'type': 'text',
            'props': {
              'data': 'Hello, Row',
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
        ],
      };

      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (context) {
            return WidgetFactory.build(context, widget: widgetData)!;
          },
        ),
      ));

      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
      expect(find.text("Hello, Row"), findsOneWidget);
    });
  });
}
