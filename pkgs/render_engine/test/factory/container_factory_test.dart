import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:render_engine/render_engine.dart';

void main() {
  group("Test Node Container:", () {
    setUpAll(() => {WidgetFactory.ensureInitialized()});

    testWidgets("should render without error", (tester) async {
      const sized = Size(380, 720);
      await tester.binding.setSurfaceSize(sized);

      final widgetData = <String, dynamic>{
        "id": "1",
        'type': 'container',
        'props': {
          'colorTheme': {
            'color': '#FFF11FFF',
          },
          'width': '200',
          'height': '200',
          'constain': false,
        },
        "child": {
          "id": "2",
          "type": "text",
          "props": {
            "data": "Hello, Container",
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

      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
      expect(find.text("Hello, Container"), findsOneWidget);
    });
  });
}
