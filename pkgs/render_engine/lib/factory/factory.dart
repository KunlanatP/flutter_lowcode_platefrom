import 'package:flutter/widgets.dart';
import 'package:render_engine/engine/engine.dart';

/// Example data
/// ```json
/// {
///    "type": "text",
///    "props": {
///      "data": "Hello, World"
///    }
/// }
/// ```
typedef WidgetData = Map<String, dynamic>;

/// Widget - Factory
abstract class Factory<T extends Widget> {
  /// Widget type in dart type not save in json
  Type get type;

  /// Widget name in json
  String get name;

  /// Get widget group name
  String get category {
    return 'basic';
  }

  String get group;

  /// Included this factory to widget category when is true
  bool get included {
    return true;
  }

  /// Export current widget to json
  Map<String, dynamic>? export(BuildContext context, T widget);

  /// Build flutter widget from json
  Widget? build(
    BuildContext context, {
    WidgetData? widget,
    Options? options,
    String? path,
    String? appID,
    String? themeMode,
  });

  /// Template in json use to make drag/drop or add widget
  Map<String, dynamic> template();

  /// Matching algorithm for export widget to json
  bool matchWidgetForExport(T? widget) => widget.runtimeType == type;
}
