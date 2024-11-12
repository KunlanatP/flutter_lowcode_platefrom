import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lowcode_plateform/simple_datas/widgets/card.dart';
import 'package:flutter_lowcode_plateform/simple_datas/widgets/form.dart';
import 'package:flutter_lowcode_plateform/simple_datas/widgets/grid_view.dart';
import 'package:flutter_lowcode_plateform/simple_datas/widgets/list_view.dart';
import 'package:flutter_lowcode_plateform/simple_datas/widgets/tabBar.dart';

import '../../../simple_datas/widgets/drawer.dart';

class PreviewPanel extends StatelessWidget {
  final String? selectedTemplate;

  const PreviewPanel({super.key, required this.selectedTemplate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Preview',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 24),
        Expanded(
          child: DeviceFrame(
            device: Devices.ios.iPhone13,
            screen: _buildPreviewContent(),
          ),
        ),
      ],
    );
  }

  Widget _buildPreviewContent() {
    if (selectedTemplate!.isEmpty) {
      return const Center(child: Text('Select a template to preview'));
    }

    switch ('$selectedTemplate'.toLowerCase()) {
      case 'blank':
        return const Scaffold();
      case 'drawer':
        return const SimpleModelWidget();
      case 'appbar':
        return Scaffold(
          appBar: AppBar(title: const Text('AppBar Template')),
          body: const Center(child: Text('Content')),
        );
      case 'tabbar':
        return const SimpleTabbarWidget();
      case 'list view':
        return SimpleListViewWidget();
      case 'grid view':
        return SimpleGridViewWidget();
      case 'form':
        return const SimpleFormWidget();
      case 'card':
        return const SimpleCardWidget();
      default:
        return Center(child: Text('Preview: $selectedTemplate'));
    }
  }
}
