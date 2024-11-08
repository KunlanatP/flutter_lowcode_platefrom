import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:render_engine/render_engine.dart';

void main() {
  group("Test Node Icon:", () {
    setUpAll(() => {WidgetFactory.ensureInitialized()});

    testWidgets("should render without error", (tester) async {
      const sized = Size(380, 720);
      await tester.binding.setSurfaceSize(sized);

      final widgetData = <String, dynamic>{
        "id": "1",
        "type": "icon",
        'props': {
          'padding': 20,
          'alignment': 'center',
          'icon': {
            'data': 'add',
            'size': 20,
            'theme': 'filled',
          },
          'colorTheme': {
            'color': '#FFF4F4F4',
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

      expect(find.byType(Icon), findsOneWidget);
    });
  });
}
