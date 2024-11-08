import 'package:flutter/material.dart';
import 'package:render_engine/factory/factory.dart';
import 'package:render_engine/factory/text_factory.dart';
import 'package:render_engine/widget/toolkit.dart';

class Options {
  final bool isDesignMode;
  const Options({
    required this.isDesignMode,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Options && other.isDesignMode == isDesignMode;
  }

  @override
  int get hashCode => isDesignMode.hashCode;
}

class WidgetFactory {
  WidgetFactory._();
  static final _parsers = <Factory>[
    TextFactory(),

    // ContainerFactory(),
    // CenterFactory(),
    // PaddingFactory(),
    // ScaffoldFactory(),
    // SliverAppbarFactory(),
    // PageFactory(),
    // SizedBoxFactory(),
    // ColumnFactory(),
    // RowFactory(),
    // ButtonFactory(),
    // FlexFactory(),
    // CardFactory(),
    // IconFactory(),
    // ImageFactory(),
    // TextFieldFactory(),
    // PageViewPageFactory(),
    // PageViewFactory(),
    // AppbarFactory(),
    // DropdownFactory(),
    // QrCodeFactory(),
    // CheckboxWidget(),
    // VideoPlayerFactory(),
    // ExpansionTileFactory(),
    // ListTileFactory(),
    // CheckboxListTileFactory(),
    // TableFactory(),
    // RadioListtileFactory(),
    // TabBarFactory(),
    // TabFactory(),
    // TabBarViewFactory(),
    // ParagraphFactory(),
    // HeadingFactory(),
    // DataGridFactory(),
    // ModalFactory(),
    // SliderFactory(),
  ];

  static final _parsersCache = <String, Factory>{};
  static bool _defaultParserInited = false;
  static List<Factory> get widgetList => _parsers;

  /// initial and cache widget parser
  static void ensureInitialized() {
    if (!_defaultParserInited) {
      for (var parser in _parsers) {
        _parsersCache[parser.name] = parser;
      }
      _defaultParserInited = true;
    }
  }

  /// build widget from json (map)
  static Widget? build(
    BuildContext context, {
    WidgetData? widget,
    String? path,
    Options? options = const Options(isDesignMode: false),
    String? appID,
    String? themeMode,
  }) {
    ensureInitialized();
    if (widget == null) return null;
    String? widgetType = widget['type'];
    if (widgetType == null) {
      throw FlutterError("Wrong widget format: $widget");
    }
    Factory<Widget>? parser;
    parser = _parsersCache[widgetType];
    if (parser == null) {
      throw FlutterError("Can't find factory for type=$widgetType");
    }
    if (options?.isDesignMode == true) {
      return HoverToolkit(
        key: ValueKey(widget['id']),
        path: path ?? '',
        type: widget['type'],
        props: widget['props'],
        data: widget,
        group: parser.group,
        child: parser.build(
          context,
          widget: widget,
          options: options,
          path: path ?? '',
          appID: appID,
          themeMode: themeMode,
        )!,
      );
    }

    return parser.build(
      context,
      widget: widget,
      options: options,
      appID: appID,
      themeMode: themeMode,
    );
  }

  /// Build children widgets from json array (List<Map>)
  static List<Widget> buildList(
    BuildContext context, {
    String? path,
    List<WidgetData>? children,
    Options? options = const Options(isDesignMode: false),
    String? appID,
    String? themeMode,
  }) {
    ensureInitialized();
    final widgets = <Widget>[];
    int amountChild = 0;
    if (children == null) return widgets;
    for (final widget in children) {
      Widget? buildWidget = build(
        context,
        widget: widget,
        options: options,
        path: '$path/$amountChild',
        appID: appID,
        themeMode: themeMode,
      );

      amountChild++;
      if (buildWidget != null) {
        Factory<Widget>? parser;
        parser = _parsersCache[widget['type']];
        if (parser!.group == 'media') {
          buildWidget = Expanded(child: buildWidget);
        }
        widgets.add(buildWidget);
      }
    }
    return widgets;
  }

  /// export json
  static WidgetData? export(BuildContext context, Widget? widget) {
    ensureInitialized();
    if (widget == null) return {};
    var parser = _findWidgetExporter(widget);
    if (parser == null) return {};
    return parser.export(context, widget)!;
  }

  static List<WidgetData>? exports(BuildContext context, List<Widget>? list) {
    ensureInitialized();
    if (list != null) return <WidgetData>[];
    final widgets = <WidgetData>[];
    for (var widget in list!) {
      final itemWidget = export(context, widget);
      if (itemWidget != null) {
        widgets.add(itemWidget);
      }
    }
    return widgets;
  }

  static Factory? _findWidgetExporter(Widget? widget) {
    for (var parser in _parsers) {
      if (parser.matchWidgetForExport(widget)) {
        return parser;
      }
    }
    return null;
  }
}
