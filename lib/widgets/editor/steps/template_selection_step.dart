import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lowcode_plateform/simple_datas/widgets/appbar.dart';
import 'package:flutter_lowcode_plateform/simple_datas/widgets/card.dart';
import 'package:flutter_lowcode_plateform/simple_datas/widgets/drawer.dart';
import 'package:flutter_lowcode_plateform/simple_datas/widgets/form.dart';
import 'package:flutter_lowcode_plateform/simple_datas/widgets/grid_view.dart';
import 'package:flutter_lowcode_plateform/simple_datas/widgets/list_view.dart';
import 'package:flutter_lowcode_plateform/simple_datas/widgets/scaffold.dart';
import 'package:flutter_lowcode_plateform/simple_datas/widgets/tabBar.dart';
import 'package:flutter_lowcode_plateform/states/page_creation_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/template_card.dart';

class TemplateSelectionStep extends ConsumerWidget {
  final String? currTemplate;

  TemplateSelectionStep({
    super.key,
    required this.currTemplate,
  });

  final templates = {
    'Default Widgets': [
      {
        'name': 'Blank',
        'icon': FluentIcons.page_fit_24_regular,
        'content': scaffoldWidget,
      },
      {
        'name': 'Drawer',
        'icon': FluentIcons.navigation_24_regular,
        'content': drawerWidget,
      },
      {
        'name': 'AppBar',
        'icon': FluentIcons.phone_status_bar_24_regular,
        'content': appBarWidget,
      },
      {
        'name': 'TabBar',
        'icon': FluentIcons.tab_desktop_24_regular,
        'content': tabBarWidget,
      },
    ],
    'Simple Widgets': [
      {
        'name': 'List View',
        'icon': FluentIcons.apps_list_24_regular,
        'content': listViewWidget,
      },
      {
        'name': 'Grid View',
        'icon': FluentIcons.grid_24_regular,
        'content': gridViewWidget,
      },
      {
        'name': 'Form',
        'icon': FluentIcons.form_24_regular,
        'content': formWidget,
      },
      {
        'name': 'Card',
        'icon': FluentIcons.card_ui_24_regular,
        'content': cardWidget,
      },
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
