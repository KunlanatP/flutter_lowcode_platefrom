import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lowcode_plateform/states/page_creation_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'page_type_card.dart';

class PageConfigurationForm extends ConsumerStatefulWidget {
  final String? selectedPageType;

  const PageConfigurationForm({
    super.key,
    required this.selectedPageType,
  });

  @override
  ConsumerState<PageConfigurationForm> createState() =>
      _PageConfigurationFormState();
}

class _PageConfigurationFormState extends ConsumerState<PageConfigurationForm> {
  final pageNameController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _wasUnfocused = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final pageState = ref.watch(pageCreationState);
    final currPageName = pageState.pageName;
    if (currPageName!.isNotEmpty) {
      pageNameController.text = currPageName;
    }
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      setState(() {
        _wasUnfocused = true;
      });
    }
  }

  final pageTypes = const [
    {'type': 'StatelessWidget', 'icon': FluentIcons.code_24_regular},
    {'type': 'StatefulWidget', 'icon': FluentIcons.code_circle_24_regular},
  ];

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  // Add this validation method in the _PageConfigurationFormState class
  String? _validatePageName(String? name) {
    if (!_wasUnfocused) return null;
    if (name == '') {
      return 'This field is required.';
    }
    if (RegExp(r'(^\s)|(\s$)').hasMatch(name!)) {
      return 'Shouldn\'t start or end with a space.';
    }
    if (RegExp(r'^[0-9]').hasMatch(name)) {
      return 'Shouldn\'t start with a number.';
    }
    if (RegExp(r'[ก-ฮ]').hasMatch(name)) {
      return 'Please use the English language only';
    }
    if (RegExp(r'[^a-zA-Z0-9]').hasMatch(name)) {
      return 'Cannot use special characters or blank space';
    }
    if (name.length > 50) {
      return 'Length of text must be between 1-50';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: pageNameController,
              focusNode: _focusNode,
              decoration: InputDecoration(
                labelText: 'Page Name',
                hintText: 'Enter a unique name for your page',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                errorText: _validatePageName(pageNameController.text),
              ),
              onChanged: (value) {
                ref
                    .read(pageCreationState.notifier)
                    .update((state) => state.copyWith(pageName: value));
              },
            ),
            const SizedBox(height: 24),
            Text(
              'Page Type',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              children: pageTypes
                  .map((type) => PageTypeCard(
                      type: type,
                      isSelected: widget.selectedPageType == type['type'],
                      onSelect: () => ref
                          .read(pageCreationState.notifier)
                          .update((state) => state.copyWith(
                              selectedPageType: type['type'] as String))))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
