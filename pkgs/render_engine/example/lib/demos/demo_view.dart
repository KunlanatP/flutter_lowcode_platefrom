import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:render_engine/render_engine.dart';

class DemoViewer extends StatefulWidget {
  final Map<String, dynamic> data;
  final String title;
  const DemoViewer({
    Key? key,
    required this.data,
    required this.title,
  }) : super(key: key);

  @override
  State<DemoViewer> createState() => _DemoViewerState();
}

class _DemoViewerState extends State<DemoViewer> {
  @override
  Widget build(BuildContext context) {
    Widget? tree = WidgetFactory.build(context, widget: widget.data);
    if (tree == null) {
      return const Padding(
        padding: EdgeInsets.all(20),
        child: Text('Empty tree'),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: DevicePreview(
        enabled: true,
        builder: (context) => MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          home: Material(child: tree),
        ),
      ),
    );
  }
}
