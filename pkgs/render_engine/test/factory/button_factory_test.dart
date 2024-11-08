import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:render_engine/render_engine.dart';

void main() async {
  setUpAll(() => {WidgetFactory.ensureInitialized()});
  testWidgets("ButtonNode: ElevatedButton", (tester) async {
    const sized = Size(380, 720);
    await tester.binding.setSurfaceSize(sized);

    final widgetData = {
      "id": "1",
      "type": "button",
      "props": {
        "data": "ElevatedButton",
        "type": "elevatedButton",
        "alignment": "center",
        "style": {
          "borderSide": {},
          "textStyle": {
            "decoration": "none",
          },
        }
      },
      "actions": {
        "onPressed": {
          "type": "void",
          "args": {},
        },
      },
    };
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) {
          return WidgetFactory.build(context, widget: widgetData)!;
        },
      ),
    ));

    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('ElevatedButton'), findsOneWidget);
  });

  testWidgets("ButtonNode: OutlinedButton", (tester) async {
    const sized = Size(380, 720);
    await tester.binding.setSurfaceSize(sized);

    final widgetData = {
      "id": "1",
      "type": "button",
      "props": {
        "data": "OutlinedButton",
        "type": "outlinedButton",
        "alignment": "center",
        "style": {
          "borderSide": {},
          "textStyle": {
            "decoration": "none",
          },
        }
      },
      "actions": {
        "onPressed": {
          "type": "void",
          "args": {},
        },
      },
    };
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) {
          return WidgetFactory.build(context, widget: widgetData)!;
        },
      ),
    ));

    expect(find.byType(OutlinedButton), findsOneWidget);
    expect(find.text('OutlinedButton'), findsOneWidget);
  });

  testWidgets("ButtonNode: TextButton", (tester) async {
    const sized = Size(380, 720);
    await tester.binding.setSurfaceSize(sized);

    final widgetData = {
      "id": "1",
      "type": "button",
      "props": {
        "data": "TextButton",
        "type": "textButton",
        "alignment": "center",
        "style": {
          "borderSide": {},
          "textStyle": {
            "decoration": "none",
          },
        }
      },
      "actions": {
        "onPressed": {
          "type": "void",
          "args": {},
        },
      },
    };
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) {
          return WidgetFactory.build(context, widget: widgetData)!;
        },
      ),
    ));

    expect(find.byType(TextButton), findsOneWidget);
    expect(find.text('TextButton'), findsOneWidget);
  });
}
