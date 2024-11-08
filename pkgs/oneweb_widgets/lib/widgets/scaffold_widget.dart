import 'package:flutter/material.dart';

class OWScaffold extends StatelessWidget {
  final Widget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;

  const OWScaffold({
    Key? key,
    this.appBar,
    this.body,
    this.bottomNavigationBar,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: backgroundColor,
      child: Stack(
        children: [
          Column(
            children: [
              if (appBar != null)
                const SizedBox(
                  height: 56,
                ),
              Expanded(
                child: Container(
                  width: size.width,
                  height: size.height - 112,
                  color: backgroundColor,
                  child: Stack(
                    children: [
                      body ?? Container(),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar != null
                  ? const SizedBox(
                      height: 56,
                      child: Text('NavBar'),
                    )
                  : const SizedBox()
            ],
          ),
          if (appBar != null) appBar!,
        ],
      ),
    );
  }
}
