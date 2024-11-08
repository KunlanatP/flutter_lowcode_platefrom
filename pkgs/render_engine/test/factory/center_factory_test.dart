import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:render_engine/render_engine.dart';

void main() {
  group("Test Node Center:", () {
    setUpAll(() => {WidgetFactory.ensureInitialized()});

    testWidgets("should render without error", (tester) async {
      const sized = Size(380, 720);
      await tester.binding.setSurfaceSize(sized);

      final widgetData = <String, dynamic>{
        "id": "1",
        "type": "center",
        "child": {
          "id": "2",
          "type": "text",
          "props": {
            "data": "Hello, Center",
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

      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
      expect(find.text("Hello, Center"), findsOneWidget);
    });
  });
}
