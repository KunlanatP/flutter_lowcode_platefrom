import 'package:flutter/material.dart';

@immutable
class EditorConfigData {
  final String appID;
  final String? pageID;

  const EditorConfigData({
    required this.appID,
    this.pageID,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EditorConfigData &&
        other.appID == appID &&
        other.pageID == pageID;
  }

  @override
  int get hashCode => appID.hashCode ^ pageID.hashCode;
}

class EditorConfig extends InheritedWidget {
  const EditorConfig({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final EditorConfigData data;

  static EditorConfig of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<EditorConfig>();
    assert(result != null, 'No EditorConfig found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(EditorConfig old) => old.data != data;
}
