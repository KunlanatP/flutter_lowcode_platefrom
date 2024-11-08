import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:render_engine/render_engine.dart';

final paddingApp = <String, dynamic>{
  "id": "ca01c69e",
  "type": "padding",
  "props": {
    "padding": 20,
  },
  "child": {
    "id": "a0af43f3",
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
  },
};

final paddingNestedApp = <String, dynamic>{
  "id": "23556c70",
  "type": "padding",
  "props": {"padding": 10},
  "child": {
    "id": "70828277",
    "type": "padding",
    "props": {"padding": 15},
    "child": {
      "id": "0b22c397",
      "type": "padding",
      "props": {"padding": 20},
      "child": {
        "id": "f82548bf",
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
      },
    }
  }
};

void main() {
  setUpAll(() => {WidgetFactory.ensureInitialized()});

  testWidgets("Render padding app", (widgetTester) async {
    const sized = Size(380, 720);
    await widgetTester.binding.setSurfaceSize(sized);

    await widgetTester.pumpWidget(EngineEvent(
      onHover: (rect, isHoving) {},
      onFocus: (rect) {},
      child: MaterialApp(
        home: Builder(
          builder: (context) => WidgetFactory.build(
            context,
            widget: paddingApp,
            options: const Options(isDesignMode: true),
          )!,
        ),
      ),
    ));
    final padding = find.byType(Padding);
    expect(padding, findsOneWidget);
    final size = widgetTester.getSize(padding);
    expect(size.width, 380);
    expect(size.height, 720);
    expect(find.text("Hello, World!"), findsOneWidget);
    expect(find.byType(HoverToolkit), findsNWidgets(2));
  });

  testWidgets("Render padding nested app", (widgetTester) async {
    const sized = Size(380, 720);
    await widgetTester.binding.setSurfaceSize(sized);

    await widgetTester.pumpWidget(EngineEvent(
      onHover: (rect, isHoving) {},
      onFocus: (rect) {},
      child: MaterialApp(
        home: Builder(
          builder: (context) => WidgetFactory.build(
            context,
            widget: paddingNestedApp,
            options: const Options(isDesignMode: true),
          )!,
        ),
      ),
    ));

    expect(find.byType(Padding), findsNWidgets(3));
    final sizeLv1 = widgetTester.getSize(
      find.byKey(const ValueKey("23556c70")),
    );
    expect(sizeLv1.width, 380);
    expect(sizeLv1.height, 720);

    final sizeLv2 = widgetTester.getSize(
      find.byKey(const ValueKey("70828277")),
    );
    expect(sizeLv2.width, 380 - 10 * 2);
    expect(sizeLv2.height, 720 - 10 * 2);

    final sizeLv3 = widgetTester.getSize(
      find.byKey(const ValueKey("0b22c397")),
    );
    expect(sizeLv3.width, 380 - 10 * 2 - 15 * 2);
    expect(sizeLv3.height, 720 - 10 * 2 - 15 * 2);

    expect(find.text("Hello, World!"), findsOneWidget);
    expect(find.byType(HoverToolkit), findsNWidgets(4));
  });

  testWidgets("Render padding app:preview mode", (widgetTester) async {
    const sized = Size(380, 720);
    await widgetTester.binding.setSurfaceSize(sized);

    await widgetTester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => WidgetFactory.build(context, widget: paddingApp)!,
      ),
    ));
    expect(find.byType(Padding), findsOneWidget);
    final padding = find.byType(Padding);
    final size = widgetTester.getSize(padding);
    expect(size.width, 380);
    expect(size.height, 720);
    expect(find.text("Hello, World!"), findsOneWidget);
    expect(find.byType(HoverToolkit), findsNothing);
  });

  testWidgets("Render padding nested app:preview mode", (widgetTester) async {
    const sized = Size(380, 720);
    await widgetTester.binding.setSurfaceSize(sized);

    await widgetTester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) =>
            WidgetFactory.build(context, widget: paddingNestedApp)!,
      ),
    ));

    expect(find.byType(Padding), findsNWidgets(3));
    final sizeLv1 = widgetTester.getSize(
      find.byKey(const ValueKey("23556c70")),
    );
    expect(sizeLv1.width, 380);
    expect(sizeLv1.height, 720);

    final sizeLv2 = widgetTester.getSize(
      find.byKey(const ValueKey("70828277")),
    );
    expect(sizeLv2.width, 380 - 10 * 2);
    expect(sizeLv2.height, 720 - 10 * 2);

    final sizeLv3 = widgetTester.getSize(
      find.byKey(const ValueKey("0b22c397")),
    );
    expect(sizeLv3.width, 380 - 10 * 2 - 15 * 2);
    expect(sizeLv3.height, 720 - 10 * 2 - 15 * 2);

    expect(find.text("Hello, World!"), findsOneWidget);
    expect(find.byType(HoverToolkit), findsNothing);
  });
}
