import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:oneweb_widgets/actions/on_click.dart';

class OWAlertDialog extends StatefulWidget {
  const OWAlertDialog({
    Key? key,
    required this.txtTitle,
    this.btnDismiss = true,
    this.isSpacer = true,
    this.width = 400,
    this.titleHeight = 60,
    this.height = 300,
    this.content,
    this.contentPadding = const EdgeInsets.all(20.0),
  }) : super(key: key);

  final String txtTitle;
  final bool btnDismiss;
  final bool isSpacer;
  final double? width;
  final double? titleHeight;
  final double? height;
  final Widget? content;
  final EdgeInsetsGeometry? contentPadding;

  @override
  _OWAlertDialogState createState() => _OWAlertDialogState();
}

class _OWAlertDialogState extends State<OWAlertDialog> {
  bool isClose = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final _title = Container(
      width: widget.width,
      height: widget.titleHeight,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            offset: Offset(0, 1),
            color: Colors.grey,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            widget.txtTitle,
            style: theme.textTheme.titleMedium,
          ),
          if (widget.btnDismiss && widget.isSpacer) const Spacer(),
          if (widget.btnDismiss)
            OWOnClick(
              onTap: () => Navigator.pop(context, 'Close'),
              onShowHoverHighlight: (value) => setState(() => isClose = value),
              child: Icon(
                isClose
                    ? FluentIcons.dismiss_16_filled
                    : FluentIcons.dismiss_16_regular,
                color: isClose ? Colors.blueAccent : Colors.grey,
              ),
            )
        ],
      ),
    );

    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      title: _title,
      content: Container(
        width: widget.width,
        height: widget.height,
        color: Colors.transparent,
        child: widget.content,
      ),
      titlePadding: const EdgeInsets.only(),
      // backgroundColor: theme.scaffoldBackgroundColor,
      contentPadding: widget.contentPadding,
      // actionsPadding: const EdgeInsets.only(bottom: 8, right: 2),
    );
  }
}
