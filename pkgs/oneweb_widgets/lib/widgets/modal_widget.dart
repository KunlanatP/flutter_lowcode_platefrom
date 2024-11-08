import 'package:flutter/material.dart';

class OWModal extends StatefulWidget {
  final Widget? body;
  final Color? backgroundColor;
  final bool isDismissible;
  final bool enableDrag;
  final AnimationStyle? sheetAnimationStyle;

  const OWModal({
    Key? key,
    this.body,
    this.backgroundColor,
    this.isDismissible = true,
    this.enableDrag = true,
    this.sheetAnimationStyle,
  }) : super(key: key);

  @override
  State<OWModal> createState() => _OWModalState();
}

class _OWModalState extends State<OWModal> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0)).then(
      (_) => showModal(),
    );
    super.initState();
  }

  void showModal() {
    showModalBottomSheet<void>(
      context: context,
      isDismissible: widget.isDismissible,
      enableDrag: widget.enableDrag,
      sheetAnimationStyle: widget.sheetAnimationStyle,
      backgroundColor: widget.backgroundColor,
      builder: (BuildContext context) {
        return SizedBox.expand(
          child: widget.body ?? Center(child: const Text('OWModal')),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return Center(
      child: ElevatedButton(
        onPressed: () => showModal(),
        child: const Text('Show Modal'),
      ),
    );
  }
}
