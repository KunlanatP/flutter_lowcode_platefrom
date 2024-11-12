import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../states/page_creation_state.dart';

class ReviewStep extends ConsumerWidget {
  const ReviewStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(pageCreationState);
    return SingleChildScrollView(
      child: Container(
        width: 600,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            _buildContent(
              context,
              pageState.pageName,
              pageState.selectedPageType,
              pageState.selectedTemplate,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.green[700]!,
            Colors.green[500]!.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            FluentIcons.checkmark_circle_24_filled,
            color: Colors.white.withOpacity(0.9),
            size: 24,
          ),
          const SizedBox(width: 12),
          Text(
            'Review Configuration',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    String? pageName,
    String? pageType,
    String? template,
  ) {
    final items = [
      _ReviewItem(
        icon: FluentIcons.document_24_regular,
        title: 'Page Name',
        value: pageName ?? '',
        color: Theme.of(context).colorScheme.primary,
      ),
      _ReviewItem(
        icon: FluentIcons.code_24_regular,
        title: 'Page Type',
        value: pageType ?? 'StatelessWidget',
        color: const Color(0xFF10B981),
      ),
      _ReviewItem(
        icon: FluentIcons.grid_24_regular,
        title: 'Template',
        value: template ?? '',
        color: const Color(0xFFF59E0B),
      ),
    ];

    return Column(
      children: items.map((item) => _buildInfoTile(context, item)).toList(),
    );
  }

  Widget _buildInfoTile(BuildContext context, _ReviewItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: item.color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: item.color.withOpacity(0.15),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: item.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(item.icon, color: item.color, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.value,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[900],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewItem {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  _ReviewItem({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });
}
