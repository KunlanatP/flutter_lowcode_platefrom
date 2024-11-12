import 'package:flutter/material.dart';

class PageTypeCard extends StatelessWidget {
  final Map<String, dynamic> type;
  final bool isSelected;
  final VoidCallback onSelect;

  const PageTypeCard({
    super.key,
    required this.type,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
              : Colors.transparent,
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : const Color(0xFFCBD5E1),
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              type['icon'],
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : const Color(0xFF1E293B),
            ),
            const SizedBox(width: 12),
            Text(
              type['type'],
              style: TextStyle(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : const Color(0xFF1E293B),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
