import 'package:flutter/material.dart';

class DeSelectWidget extends StatelessWidget {
  final Widget child;

  const DeSelectWidget({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: child,
    );
  }
}

class UnfocusTextWidget extends StatelessWidget {
  final Widget child;

  const UnfocusTextWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: child,
    );
  }
}
