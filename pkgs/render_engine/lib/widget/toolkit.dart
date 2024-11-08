import 'package:flutter/material.dart';
import 'package:render_engine/event/widget_context.dart';

typedef WidgetProps = Map<String, dynamic>;

class HoverToolkit extends StatefulWidget {
  const HoverToolkit({
    required ValueKey key,
    required this.child,
    required this.type,
    required this.path,
    required this.props,
    required this.data,
    required this.group,
  }) : super(key: key);

  final Widget child;
  final String type;
  final String path;
  final WidgetProps? props;
  final Map<String, dynamic> data;
  final String group;

  @override
  State<HoverToolkit> createState() => _HoverToolkitState();
}

class _HoverToolkitState extends State<HoverToolkit> {
  final GlobalKey focusableKey = GlobalKey(debugLabel: 'widget#data');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final engineEvent = EngineEvent.of(context);
    return GestureDetector(
      key: focusableKey,
      onSecondaryTap: () {
        if (focusableKey.currentContext != null &&
            engineEvent.onRightClick != null) {
          // final rect = getClientRect(focusableKey.currentContext!);
          engineEvent.onRightClick!(WidgetContext(
            context: focusableKey.currentContext!,
            path: widget.path,
            widgetData: widget.data,
            group: widget.group,
          ));
          return;
        }
      },
      onTap: () {
        if (focusableKey.currentContext != null) {
          // final rect = getClientRect(focusableKey.currentContext!);
          engineEvent.onFocus(WidgetContext(
            context: focusableKey.currentContext!,
            path: widget.path,
            widgetData: widget.data,
            group: widget.group,
          ));
          return;
        }
      },
      child: FocusableActionDetector(
        key: widget.key,
        onShowHoverHighlight: (isHover) {
          if (focusableKey.currentContext != null) {
            // final rect = getClientRect(focusableKey.currentContext!);
            engineEvent.onHover(
              WidgetContext(
                context: focusableKey.currentContext!,
                path: widget.path,
                widgetData: widget.data,
                group: widget.group,
              ),
              isHover,
            );
          }
        },
        child: widget.child,
        // child: Draggable<int>( 
        //   data: 10,
        //   feedback: const SizedBox(
        //     width: 15,
        //     height: 15,
        //     child: ColoredBox(color: Colors.orangeAccent),
        //   ),
        //   childWhenDragging: Opacity(
        //     opacity: 0.2,
        //     child: Material(child: widget.child),
        //   ),
        //   child: widget.child,
        //   onDragStarted: () {
        //     log.d('onDragStarted');
        //   },
        //   onDragEnd: (detail) {},
        // ),
      ),
    );
  }
}

typedef HoverCallback = void Function(WidgetContext rect, bool isHover);
typedef FocusCallback = void Function(WidgetContext rect);
typedef RightClickCallback = void Function(WidgetContext rect);

class EngineEvent extends InheritedWidget {
  const EngineEvent({
    Key? key,
    required Widget child,
    required this.onHover,
    required this.onFocus,
    this.onRightClick,
  }) : super(key: key, child: child);

  final HoverCallback onHover;
  final FocusCallback onFocus;
  final RightClickCallback? onRightClick;

  static EngineEvent of(BuildContext context) {
    final EngineEvent? result =
        context.dependOnInheritedWidgetOfExactType<EngineEvent>();
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(EngineEvent oldWidget) =>
      onHover != oldWidget.onHover;
}
