import 'package:flutter/material.dart';

/// Page Widget
/// Resposibility about Page layout and Route
class OWPage extends StatefulWidget {
  const OWPage({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  _OWPageState createState() => _OWPageState();
}

class _OWPageState extends State<OWPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: widget.children,
      ),
    );
  }
}
