import 'package:flutter/material.dart';

class StepIndicatorBar extends StatelessWidget {
  final int currentStep;

  const StepIndicatorBar({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: _buildStepIndicator(
                    step: 0,
                    label: 'Configure',
                    isActive: currentStep >= 0,
                    theme: theme,
                  ),
                ),
                _buildStepConnector(
                  context: context,
                  isActive: currentStep > 0,
                  theme: theme,
                ),
                Expanded(
                  child: _buildStepIndicator(
                    step: 1,
                    label: 'Choose Template',
                    isActive: currentStep >= 1,
                    theme: theme,
                  ),
                ),
                _buildStepConnector(
                  context: context,
                  isActive: currentStep > 1,
                  theme: theme,
                ),
                Expanded(
                  child: _buildStepIndicator(
                    step: 2,
                    label: 'Preview',
                    isActive: currentStep >= 2,
                    theme: theme,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStepIndicator({
    required int step,
    required String label,
    required bool isActive,
    required ColorScheme theme,
  }) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: isActive ? theme.primary : const Color(0xFFE2E8F0),
              shape: BoxShape.circle,
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: theme.primary.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      )
                    ]
                  : null,
            ),
            child: Center(
              child: Text(
                '${step + 1}',
                style: TextStyle(
                  color: isActive
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xFF1E293B),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: isActive ? theme.primary : const Color(0xFF1E293B),
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepConnector({
    required BuildContext context,
    required bool isActive,
    required ColorScheme theme,
  }) {
    return Container(
      width: 48,
      height: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: isActive ? theme.primary : theme.surfaceVariant,
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}
