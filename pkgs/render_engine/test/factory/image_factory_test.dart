import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:render_engine/render_engine.dart';

void main() {
  group("Test Node Image:", () {
    setUpAll(() => {WidgetFactory.ensureInitialized()});

    testWidgets("should render without error", (tester) async {
      const sized = Size(380, 720);
      await tester.binding.setSurfaceSize(sized);

      final widgetData = <String, dynamic>{
        'id': '1',
        'type': 'image',
        'props': {
          'image':
              'https://i.pinimg.com/564x/1a/72/b5/1a72b5f7a728654bf52372d49292790f.jpg',
          'width': '100',
          'height': '100',
          'alignment': 'center',
        },
      };

      HttpOverrides.global = null;

      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (context) {
            return WidgetFactory.build(context, widget: widgetData)!;
          },
        ),
      ));

      expect(find.byType(Image), findsOneWidget);
    });
  });
}
