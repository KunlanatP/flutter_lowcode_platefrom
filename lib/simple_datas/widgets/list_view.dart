import 'package:uuid/uuid.dart';

import 'package:flutter/material.dart';

class SimpleListViewWidget extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      "title": "Item 1",
      "subtitle": "This is the description for item 1",
      "image": "https://via.placeholder.com/150"
    },
    {
      "title": "Item 2",
      "subtitle": "This is the description for item 2",
      "image": "https://via.placeholder.com/150"
    },
    {
      "title": "Item 3",
      "subtitle": "This is the description for item 3",
      "image": "https://via.placeholder.com/150"
    },
    // Add more items if needed
  ];

  SimpleListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modern ListView UI"),
        backgroundColor: const Color(0xFF1976D2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return CardItem(
              title: items[index]["title"]!,
              subtitle: items[index]["subtitle"]!,
              imageUrl: items[index]["image"]!,
            );
          },
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  const CardItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrl,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      ),
    );
  }
}

final listViewWidget = {
  'id': const Uuid().v4(),
  'type': 'scaffold',
  'props': {'colorTheme': '#FFF4F4F4'},
  'body': {
    'id': const Uuid().v4(),
    'type': 'listView',
    'props': {
      'scrollDirection': 'vertical',
      'padding': {'top': 8, 'bottom': 8, 'left': 16, 'right': 16},
      'itemCount': 10,
    },
    'children': List.generate(
        10,
        (index) => ({
              'id': const Uuid().v4(),
              'type': 'listTile',
              'props': {
                'title': 'Item $index',
                'subtitle': 'Subtitle description',
                'leading': {
                  'type': 'icon',
                  'props': {
                    'icon': 'list',
                    'size': 24,
                    'colorTheme': '#FF212121'
                  }
                },
                'trailing': {
                  'type': 'icon',
                  'props': {
                    'icon': 'chevron_right',
                    'size': 24,
                    'colorTheme': '#FF757575'
                  }
                },
              }
            })).toList(),
  }
};
