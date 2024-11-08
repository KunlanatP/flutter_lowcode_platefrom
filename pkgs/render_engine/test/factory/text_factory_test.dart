import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:render_engine/render_engine.dart';

void main() async {
  setUpAll(() => {WidgetFactory.ensureInitialized()});

  testWidgets("TextNode with maxLines and softWrap", (tester) async {
    final testCases = <String, Map<String, dynamic>>{
      "maxLine as a number": {
        "mock": <String, dynamic>{
          "id": "1",
          "type": "text",
          "props": {
            'data': 'Hello, World!',
            'softWrap': false,
            'maxLines': 1,
            'textAlign': 'left',
            'style': {
              'fontStyle': 'normal',
              'decoration': 'none',
            },
          }
        },
        "expected": {
          'softWrap': false,
          'maxLines': 1,
        },
      },
      "maxLine as a string": {
        "mock": <String, dynamic>{
          "id": "1",
          "type": "text",
          "props": {
            'data': 'Hello, World!',
            'softWrap': false,
            'maxLines': '1',
            'textAlign': 'left',
            'style': {
              'fontStyle': 'normal',
              'decoration': 'none',
            },
          }
        },
        "expected": {
          'softWrap': false,
          'maxLines': 1,
        },
      },
      "maxLine should be null": {
        "mock": <String, dynamic>{
          "id": "1",
          "type": "text",
          "props": {
            "data": "Text Example",
            'textAlign': 'left',
            'style': {
              'fontStyle': 'normal',
              'decoration': 'none',
            },
            'colorTheme': {
              'color': '#FF800000',
            }
          }
        },
        "expected": {
          "maxLines": null,
          "softWrap": false,
        }
      }
    };

    const sized = Size(380, 720);
    await tester.binding.setSurfaceSize(sized);

    for (var el in testCases.entries) {
      final testCase = el.key;
      final widgetData = el.value["mock"];
      final expected = el.value["expected"];

      await tester.pumpWidget(Material(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Builder(
            builder: (context) {
              return WidgetFactory.build(context, widget: widgetData)!;
            },
          ),
        ),
      ));
      expect(
          find.byKey(ValueKey(widgetData['id'] as String), skipOffstage: false),
          findsOneWidget,
          reason: testCase);
      expect(find.text(widgetData['props']['data']), findsOneWidget,
          reason: testCase);

      final text = find
          .text(widgetData['props']['data'])
          .evaluate()
          .single
          .widget as Text;
      expect(text.maxLines, expected['maxLines'], reason: testCase);
      expect(text.softWrap, expected['softWrap'], reason: testCase);
      expect(text.key, ValueKey(widgetData['id'] as String), reason: testCase);
    }
  });

  testWidgets("TextNode with textOverflow", (tester) async {
    final testCases = <String, Map<String, dynamic>>{
      "overflow ellipsis": {
        "mock": <String, dynamic>{
          "id": "1",
          "type": "text",
          "props": {
            "data": "Text Example",
            "overflow": "ellipsis",
            'softWrap': true,
            'textAlign': 'left',
            'style': {
              'fontStyle': 'normal',
              'decoration': 'none',
            },
            'colorTheme': {
              'color': '#FF800000',
            }
          }
        },
        "expected": TextOverflow.ellipsis,
      },
      "overflow clip": {
        "mock": <String, dynamic>{
          "id": "2",
          "type": "text",
          "props": {
            "data": "Text Example",
            "overflow": "clip",
            'softWrap': true,
            'textAlign': 'left',
            'style': {
              'fontStyle': 'normal',
              'decoration': 'none',
            },
            'colorTheme': {
              'color': '#FF800000',
            }
          }
        },
        "expected": TextOverflow.clip,
      },
      "overflow fade": {
        "mock": <String, dynamic>{
          "id": "3",
          "type": "text",
          "props": {
            "data": "Text Example",
            "overflow": "fade",
            'softWrap': true,
            'textAlign': 'left',
            'style': {
              'fontStyle': 'normal',
              'decoration': 'none',
            },
            'colorTheme': {
              'color': '#FF800000',
            }
          }
        },
        "expected": TextOverflow.fade,
      },
      "overflow visible": {
        "mock": <String, dynamic>{
          "id": "4",
          "type": "text",
          "props": {
            "data": "Text Example",
            "overflow": "visible",
            'softWrap': true,
            'textAlign': 'left',
            'style': {
              'fontStyle': 'normal',
              'decoration': 'none',
            },
            'colorTheme': {
              'color': '#FF800000',
            }
          }
        },
        "expected": TextOverflow.visible,
      },
      "overflow null": {
        "mock": <String, dynamic>{
          "id": "4",
          "type": "text",
          "props": {
            "data": "Text Example",
            'softWrap': true,
            'textAlign': 'left',
            'style': {
              'fontStyle': 'normal',
              'decoration': 'none',
            },
            'colorTheme': {
              'color': '#FF800000',
            }
          }
        },
        "expected": null,
      },
    };

    const sized = Size(380, 720);
    await tester.binding.setSurfaceSize(sized);

    for (var el in testCases.entries) {
      final testCase = el.key;
      final widgetData = el.value["mock"];
      final expected = el.value["expected"];

      await tester.pumpWidget(Material(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Builder(
            builder: (context) {
              return WidgetFactory.build(context, widget: widgetData)!;
            },
          ),
        ),
      ));
      expect(find.byKey(ValueKey(widgetData['id'] as String)), findsOneWidget,
          reason: testCase);
      expect(find.text(widgetData['props']['data']), findsOneWidget,
          reason: testCase);

      final text = find
          .text(widgetData['props']['data'])
          .evaluate()
          .single
          .widget as Text;
      expect(text.maxLines, null, reason: testCase);
      expect(text.overflow, expected, reason: testCase);
      expect(text.key, ValueKey(widgetData['id'] as String), reason: testCase);
    }
  });

  testWidgets("TextNode with textAlign", (tester) async {
    final testCases = <String, Map<String, dynamic>>{
      "textAlign right": {
        "mock": <String, dynamic>{
          "id": "1",
          "type": "text",
          "props": {
            "data": "Text Example",
            "textAlign": "right",
            'softWrap': true,
            'style': {
              'fontStyle': 'normal',
              'decoration': 'none',
            },
            'colorTheme': {
              'color': '#FF800000',
            }
          }
        },
        "expected": TextAlign.right,
      },
      "textAlign center": {
        "mock": <String, dynamic>{
          "id": "2",
          "type": "text",
          "props": {
            "data": "Text Example",
            "textAlign": "center",
            'softWrap': true,
            'style': {
              'fontStyle': 'normal',
              'decoration': 'none',
            },
            'colorTheme': {
              'color': '#FF800000',
            }
          }
        },
        "expected": TextAlign.center,
      },
      "textAlign justify": {
        "mock": <String, dynamic>{
          "id": "3",
          "type": "text",
          "props": {
            "data": "Text Example",
            "textAlign": "justify",
            'softWrap': true,
            'style': {
              'fontStyle': 'normal',
              'decoration': 'none',
            },
            'colorTheme': {
              'color': '#FF800000',
            }
          }
        },
        "expected": TextAlign.justify,
      },
      "textAlign left": {
        "mock": <String, dynamic>{
          "id": "4",
          "type": "text",
          "props": {
            "data": "Text Example",
            "textAlign": "left",
            'softWrap': true,
            'style': {
              'fontStyle': 'normal',
              'decoration': 'none',
            },
            'colorTheme': {
              'color': '#FF800000',
            }
          }
        },
        "expected": TextAlign.left,
      },
      "textAlign start": {
        "mock": <String, dynamic>{
          "id": "4",
          "type": "text",
          "props": {
            "data": "Text Example",
            "textAlign": "start",
            'softWrap': true,
            'style': {
              'fontStyle': 'normal',
              'decoration': 'none',
            },
            'colorTheme': {
              'color': '#FF800000',
            }
          }
        },
        "expected": TextAlign.start,
      },
      "textAlign end": {
        "mock": <String, dynamic>{
          "id": "4",
          "type": "text",
          "props": {
            "data": "Text Example",
            "textAlign": "end",
            'softWrap': true,
            'style': {
              'fontStyle': 'normal',
              'decoration': 'none',
            },
            'colorTheme': {
              'color': '#FF800000',
            }
          }
        },
        "expected": TextAlign.end,
      },
      "textAlign null": {
        "mock": <String, dynamic>{
          "id": "4",
          "type": "text",
          "props": {
            "data": "Text Example",
            'softWrap': true,
            'style': {
              'fontStyle': 'normal',
              'decoration': 'none',
            },
            'colorTheme': {
              'color': '#FF800000',
            }
          }
        },
        "expected": null,
      },
    };

    const sized = Size(380, 720);
    await tester.binding.setSurfaceSize(sized);

    for (var el in testCases.entries) {
      final testCase = el.key;
      final widgetData = el.value["mock"];
      final expected = el.value["expected"];

      await tester.pumpWidget(Material(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Builder(
            builder: (context) {
              return WidgetFactory.build(context, widget: widgetData)!;
            },
          ),
        ),
      ));
      expect(find.byKey(ValueKey(widgetData['id'] as String)), findsOneWidget,
          reason: testCase);
      expect(find.text(widgetData['props']['data']), findsOneWidget,
          reason: testCase);

      final text = find
          .text(widgetData['props']['data'])
          .evaluate()
          .single
          .widget as Text;
      expect(text.maxLines, null, reason: testCase);
      expect(text.textAlign, expected, reason: testCase);
      expect(text.key, ValueKey(widgetData['id'] as String), reason: testCase);
    }
  });

  testWidgets("TextNode with style", (tester) async {
    final testCases = <String, Map<String, dynamic>>{
      "style not null": {
        "mock": <String, dynamic>{
          "id": "1",
          "type": "text",
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
          }
        },
        "expected": {
          'fontFamily': 'Abel',
          'fontSize': 34,
          'fontWeight': 'w400',
          'letterSpacing': 0.25,
          'fontStyle': 'normal',
          'decoration': 'none',
        },
      },
    };

    const sized = Size(380, 720);
    await tester.binding.setSurfaceSize(sized);

    for (var el in testCases.entries) {
      final testCase = el.key;
      final widgetData = el.value["mock"];
      final expected = el.value["expected"];

      await tester.pumpWidget(Material(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Builder(
            builder: (context) {
              return WidgetFactory.build(context, widget: widgetData)!;
            },
          ),
        ),
      ));
      expect(
          find.byKey(ValueKey(widgetData['id'] as String), skipOffstage: false),
          findsOneWidget,
          reason: testCase);
      expect(find.text(widgetData['props']['data']), findsOneWidget,
          reason: testCase);

      final text = find
          .text(widgetData['props']['data'])
          .evaluate()
          .single
          .widget as Text;
      expect(
        text.style?.fontFamily,
        GoogleFonts.getFont(expected['fontFamily']).fontFamily,
        reason: testCase,
      );
      expect(text.style?.fontSize, expected['fontSize'], reason: testCase);
      // expect(
      //   text.style?.fontWeight,
      //   mapFontWeight[expected['fontWeight']],
      //   reason: testCase,
      // );
      expect(
        text.style?.letterSpacing,
        expected['letterSpacing'],
        reason: testCase,
      );
      // expect(
      //   text.style?.fontStyle,
      //   mapFontStyle[expected['fontStyle']],
      //   reason: testCase,
      // );
      // expect(
      //   text.style?.decoration,
      //   mapDecoration[expected['decoration']],
      //   reason: testCase,
      // );
      expect(text.key, ValueKey(widgetData['id'] as String), reason: testCase);
    }
  });

  testWidgets("TextNode with color", (tester) async {
    final testCases = <String, Map<String, dynamic>>{
      "Text color": {
        "mock": <String, dynamic>{
          "id": "1",
          "type": "text",
          'props': {
            'data': 'Hello, World!',
            'softWrap': true,
            'maxLines': '1',
            'textAlign': 'left',
            'style': {
              'fontStyle': 'normal',
              'decoration': 'none',
            },
            'colorTheme': {
              'color': '#FF800000',
            }
          }
        },
        "expected": '#FF800000',
      },
    };

    const sized = Size(380, 720);
    await tester.binding.setSurfaceSize(sized);

    for (var el in testCases.entries) {
      final testCase = el.key;
      final widgetData = el.value["mock"];
      final expected = el.value["expected"];

      await tester.pumpWidget(Material(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Builder(
            builder: (context) {
              return WidgetFactory.build(context, widget: widgetData)!;
            },
          ),
        ),
      ));
      expect(
          find.byKey(ValueKey(widgetData['id'] as String), skipOffstage: false),
          findsOneWidget,
          reason: testCase);
      expect(find.text(widgetData['props']['data']), findsOneWidget,
          reason: testCase);

      final text = find
          .text(widgetData['props']['data'])
          .evaluate()
          .single
          .widget as Text;
      // expect(
      //   text.style?.color,
      //   HexColor.fromHex(expected),
      //   reason: testCase,
      // );
      expect(text.key, ValueKey(widgetData['id'] as String), reason: testCase);
    }
  });
}
