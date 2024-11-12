import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lowcode_plateform/states/page_creation_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/template_card.dart';

class TemplateSelectionStep extends ConsumerWidget {
  final String? currTemplate;

  const TemplateSelectionStep({
    super.key,
    required this.currTemplate,
  });

  final templates = const {
    'Default Widgets': [
      {'name': 'Blank', 'icon': FluentIcons.page_fit_24_regular},
      {'name': 'Scaffold', 'icon': FluentIcons.layout_cell_four_24_regular},
      {'name': 'AppBar', 'icon': FluentIcons.navigation_24_regular},
      {'name': 'TabBar', 'icon': FluentIcons.tab_desktop_24_regular},
    ],
    'Simple Widgets': [
      {'name': 'List View', 'icon': FluentIcons.list_24_regular},
      {'name': 'Grid View', 'icon': FluentIcons.grid_24_regular},
      {'name': 'Form', 'icon': FluentIcons.form_24_regular},
      {'name': 'Card', 'icon': FluentIcons.card_ui_24_regular},
    ],
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose Template',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 24),
        Expanded(
          child: ListView.builder(
            itemCount: templates.length,
            itemBuilder: (context, index) {
              final category = templates.keys.elementAt(index);
              final categoryTemplates = templates[category]!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      category,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: categoryTemplates.length,
                    itemBuilder: (context, templateIndex) => TemplateCard(
                      template: categoryTemplates[templateIndex],
                      isSelected: currTemplate ==
                          categoryTemplates[templateIndex]['name'] as String,
                      onSelect: () =>
                          ref.read(pageCreationState.notifier).update(
                                (state) => state.copyWith(
                                  selectedTemplate:
                                      categoryTemplates[templateIndex]['name']
                                          as String,
                                ),
                              ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
