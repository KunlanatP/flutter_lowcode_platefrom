import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

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
      case 'blank page':
        return const Scaffold();
      case 'scaffold':
        return const Scaffold(
          body: Center(child: Text('Scaffold Template')),
        );
      case 'appbar':
        return Scaffold(
          appBar: AppBar(title: const Text('AppBar Template')),
          body: const Center(child: Text('Content')),
        );
      case 'tabbar':
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('TabBar Template'),
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'Tab 1'),
                  Tab(text: 'Tab 2'),
                  Tab(text: 'Tab 3'),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                Center(child: Text('Tab 1 Content')),
                Center(child: Text('Tab 2 Content')),
                Center(child: Text('Tab 3 Content')),
              ],
            ),
          ),
        );
      case 'list view':
        return Scaffold(
          appBar: AppBar(title: const Text('ListView Template')),
          body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text('Item ${index + 1}'),
              subtitle: Text('Description for item ${index + 1}'),
            ),
          ),
        );
      case 'grid view':
        return Scaffold(
          appBar: AppBar(title: const Text('GridView Template')),
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: 8,
            itemBuilder: (context, index) => Card(
              child: Center(child: Text('Grid Item ${index + 1}')),
            ),
          ),
        );
      case 'form':
        return Scaffold(
          appBar: AppBar(title: const Text('Form Template')),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        );
      case 'card':
        return Scaffold(
          appBar: AppBar(title: const Text('Card Template')),
          body: Center(
            child: Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const FlutterLogo(size: 64),
                    const SizedBox(height: 16),
                    const Text(
                      'Card Title',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Card description and content goes here'),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {},
                      child: const Text('ACTION'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      default:
        return Center(child: Text('Preview: $selectedTemplate'));
    }
  }
}
