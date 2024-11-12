import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../states/page_creation_state.dart';
import 'components/preview_panel.dart';
import 'components/step_indicator.dart';
import 'steps/configuration_step.dart';
import 'steps/review_step.dart';
import 'steps/template_selection_step.dart';

class CreatePageDialog extends ConsumerWidget {
  const CreatePageDialog({super.key});

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Create New Page',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  Widget _buildValidationDialog(BuildContext context, String errorMessage) {
    final colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Container(
        padding: const EdgeInsets.all(24),
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.warning_rounded, color: colorScheme.error, size: 28),
                const SizedBox(width: 16),
                Text(
                  'Validation Error',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(errorMessage, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                  onPressed: () => Navigator.pop(context),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text('Got it'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool _validateCurrentStep(BuildContext context, int step, WidgetRef ref) {
    final pageState = ref.watch(pageCreationState);
    final name = pageState.pageName;
    final template = pageState.selectedTemplate;

    String? errorMessage = switch (step) {
      0 => name == null || name.isEmpty
          ? 'This field is required.'
          : RegExp(r'(^\s)|(\s$)').hasMatch(name)
              ? 'Shouldn\'t start with a blank or end with a space.'
              : RegExp(r'^[0-9]').hasMatch(name)
                  ? 'Shouldn\'t start with a number.'
                  : RegExp(r'[ก-ฮ]').hasMatch(name)
                      ? 'Please use the English language only'
                      : RegExp(r'[^a-zA-Z0-9]').hasMatch(name)
                          ? 'Cannot use special characters or blank space'
                          : name.length > 50
                              ? 'Length of text must be between 1-50'
                              : null,
      1 => template == null ? 'Please select a template' : null,
      2 => name!.isEmpty ? 'Please enter a page name' : null,
      _ => null,
    };

    if (errorMessage != null) {
      showDialog(
        context: context,
        builder: (context) => _buildValidationDialog(context, errorMessage),
      );
      return false;
    }
    return true;
  }

  Widget _buildActionButtons(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(pageCreationState);
    final step = pageState.currentStep ?? 0;
    final isLastStep = step == 2;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(top: BorderSide(color: colorScheme.outlineVariant)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCancelButton(context, colorScheme),
          Row(
            children: [
              if (step > 0) _buildBackButton(context, ref, colorScheme),
              const SizedBox(width: 16),
              _buildNextButton(context, step, isLastStep, ref, colorScheme),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCancelButton(BuildContext context, ColorScheme colorScheme) {
    return OutlinedButton.icon(
      onPressed: () => Navigator.of(context).pop(),
      icon: const Icon(Icons.close),
      label: const Text('Cancel'),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        side: BorderSide(color: colorScheme.outline.withOpacity(0.5)),
        foregroundColor: colorScheme.onSurface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildBackButton(
    BuildContext context,
    WidgetRef ref,
    ColorScheme colorScheme,
  ) {
    return TextButton.icon(
      onPressed: () {
        ref.read(pageCreationState.notifier).update(
            (state) => state.copyWith(currentStep: state.currentStep! - 1));
      },
      icon: const Icon(Icons.arrow_back),
      label: const Text('Back'),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        foregroundColor: colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildNextButton(
    BuildContext context,
    int step,
    bool isLastStep,
    WidgetRef ref,
    ColorScheme colorScheme,
  ) {
    return FilledButton.icon(
      onPressed: ((step == 0 &&
                  (ref.watch(pageCreationState).pageName == null ||
                      ref.watch(pageCreationState).pageName!.isEmpty)) ||
              (step == 1 &&
                  ref.watch(pageCreationState).selectedTemplate == null))
          ? null
          : () {
              if (_validateCurrentStep(context, step, ref)) {
                if (isLastStep) {
                  Navigator.of(context).pop(true);
                } else {
                  ref.read(pageCreationState.notifier).update((state) =>
                      state.copyWith(currentStep: state.currentStep! + 1));
                }
              }
            },
      icon: Icon(isLastStep ? Icons.check : Icons.arrow_forward),
      label: Text(isLastStep ? 'Create Page' : 'Next Step'),
      style: _getFilledButtonStyle(colorScheme, step: step),
    );
  }

  ButtonStyle _getFilledButtonStyle(ColorScheme colorScheme,
      {required int step}) {
    return FilledButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      backgroundColor: step == 2 ? Colors.green[700]! : colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      disabledBackgroundColor: colorScheme.surfaceVariant,
      disabledForegroundColor: colorScheme.onSurfaceVariant,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  Widget _getCurrentStepContent(WidgetRef ref) {
    final pageState = ref.watch(pageCreationState);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: switch (pageState.currentStep) {
        0 => ConfigurationStep(selectedPageType: pageState.selectedPageType),
        1 => TemplateSelectionStep(currTemplate: pageState.selectedTemplate),
        2 => const ReviewStep(),
        _ => const SizedBox(),
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(pageCreationState);

    final pageState = ref.watch(pageCreationState);
    final step = pageState.currentStep ?? 0;
    final currTemplate = pageState.selectedTemplate;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            constraints: const BoxConstraints(
              minWidth: 800,
              minHeight: 500,
              maxWidth: 900,
              maxHeight: 714,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.1),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 24),
                  StepIndicatorBar(currentStep: step),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: step == 2 ? 3 : 1,
                            child: Card(
                              elevation: 0,
                              color: Theme.of(context).colorScheme.surface,
                              child: _getCurrentStepContent(ref),
                            ),
                          ),
                          if (step == 2) ...[
                            const SizedBox(width: 24),
                            Expanded(
                              flex: 2,
                              child: Card(
                                elevation: 0,
                                color: Theme.of(context).colorScheme.surface,
                                child: Center(
                                  child: PreviewPanel(
                                      selectedTemplate: currTemplate),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  _buildActionButtons(context, ref),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
