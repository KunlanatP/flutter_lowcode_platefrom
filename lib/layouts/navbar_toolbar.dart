import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class Toolbar extends ConsumerWidget {
  const Toolbar({super.key});

  List<Widget> navbar(BuildContext context, WidgetRef ref);
  Widget? mode(BuildContext context, WidgetRef ref);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF1E1E1E)
            : Theme.of(context).cardColor,
        boxShadow: Theme.of(context).brightness == Brightness.dark
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                )
              ]
            : [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.02),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
      ),
      child: Row(
        children: [
          _buildLogoSection(),
          const Spacer(),
          _buildModeMenu(context, ref),
          const Spacer(),
          _buildNavItems(context, ref),
        ],
      ),
    );
  }

  Widget _buildNavItems(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF2D2D2D)
            : Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white.withOpacity(0.1)
              : Colors.transparent,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...navbar(context, ref).map((widget) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: widget,
              )),
        ],
      ),
    );
  }

  Widget _buildModeMenu(BuildContext context, WidgetRef ref) {
    if (mode(context, ref) == null) {
      return const SizedBox();
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF2D2D2D)
            : Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white.withOpacity(0.1)
              : Colors.transparent,
        ),
      ),
      child: mode(context, ref),
    );
  }

  Widget _buildLogoSection() {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Image.asset('assets/logo.png', fit: BoxFit.contain),
    );
  }
}

class Navbar extends Toolbar {
  const Navbar({
    this.menus,
    this.modes,
    super.key,
  });
  final List<Widget>? menus;
  final Widget? modes;

  @override
  List<Widget> navbar(BuildContext context, WidgetRef ref) {
    return menus ?? [const Spacer()];
  }

  @override
  Widget? mode(BuildContext context, WidgetRef ref) {
    return modes;
  }
}
