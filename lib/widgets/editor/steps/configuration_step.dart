import 'package:flutter/material.dart';

import '../components/page_configuration_form.dart';

class ConfigurationStep extends StatelessWidget {
  final String? selectedPageType;

  const ConfigurationStep({
    super.key,
    required this.selectedPageType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Page Configuration',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 24),
        PageConfigurationForm(
          selectedPageType: selectedPageType,
        ),
      ],
    );
  }
}
