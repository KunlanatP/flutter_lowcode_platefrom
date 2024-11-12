import 'package:device_frame/device_frame.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/editor/create_page_dialog.dart';

class EmptyContentPage extends ConsumerStatefulWidget {
  const EmptyContentPage({
    super.key,
    required this.appID,
    required this.device,
    required this.isFrameVisible,
    required this.orientation,
    required this.zoomLevel,
  });

  final String appID;
  final DeviceInfo device;
  final bool isFrameVisible;
  final Orientation orientation;
  final double zoomLevel;

  @override
  ConsumerState<EmptyContentPage> createState() => _UIEmptyContentPageState();
}

class _UIEmptyContentPageState extends ConsumerState<EmptyContentPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
          width: 2,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FluentIcons.apps_48_filled,
              size: 80,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 24),
            Text(
              'No Page',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _BuildButton(
                  icon: FluentIcons.add_square_48_filled,
                  label: 'Create New Page',
                  onTap: () => {
                    showDialog(
                      context: context,
                      builder: (context) => StatefulBuilder(
                        builder: (context, setState) {
                          return CreatePageDialog();
                        },
                      ),
                    ),
                  },
                ),
                const SizedBox(width: 16),
                _BuildButton(
                  icon: FluentIcons.sparkle_48_filled,
                  label: 'AI Generate',
                  onTap: () {
                    // TODO: Implement AI generation
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildButton extends StatelessWidget {
  const _BuildButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 24, color: Theme.of(context).primaryColor),
              const SizedBox(width: 12),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
