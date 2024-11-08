import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:render_engine/render_engine.dart';

void main() {
  group("Test Node SizedBox:", () {
    setUpAll(() => {WidgetFactory.ensureInitialized()});

    testWidgets("should render without error", (tester) async {
      const sized = Size(380, 720);
      await tester.binding.setSurfaceSize(sized);

      final widgetData = <String, dynamic>{
        "id": "1",
        "type": "sizedBox",
        'props': {
          'width': '200',
          'height': '100',
        },
        "child": {
          "id": "2",
          "type": "text",
          "props": {
            "data": "Hello, SizedBox",
            "softWrap": true,
            "maxLines": "1",
            "textAlign": "left",
            "style": {
              "fontStyle": "normal",
              "decoration": "none",
            },
            "colorTheme": {
              "color": "#FF323232",
            }
          },
        }
      };

      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (context) {
            return WidgetFactory.build(context, widget: widgetData)!;
          },
        ),
      ));

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
      expect(find.text("Hello, SizedBox"), findsOneWidget);
    });
  });
}
