import 'package:uuid/uuid.dart';

import 'package:flutter/material.dart';

class SimpleGridViewWidget extends StatelessWidget {
  final List<Map<String, String>> items = [
    {"title": "Item 1", "image": "https://via.placeholder.com/150"},
    {"title": "Item 2", "image": "https://via.placeholder.com/150"},
    {"title": "Item 3", "image": "https://via.placeholder.com/150"},
    {"title": "Item 4", "image": "https://via.placeholder.com/150"},
    // Add more items if needed
  ];

  SimpleGridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modern GridView UI"),
        backgroundColor: const Color(0xFF1976D2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 3 / 4, // Aspect ratio for each grid item
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GridItem(
              title: items[index]["title"]!,
              imageUrl: items[index]["image"]!,
            );
          },
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  const GridItem({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image section
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Title section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

final gridViewWidget = {
  'id': const Uuid().v4(),
  'type': 'scaffold',
  'props': {'colorTheme': '#FFF4F4F4'},
  'body': {
    'id': const Uuid().v4(),
    'type': 'gridView',
    'props': {
      'crossAxisCount': 2,
      'mainAxisSpacing': 10.0,
      'crossAxisSpacing': 10.0,
      'padding': {'all': 16.0},
    },
    'children': List.generate(
        8,
        (index) => ({
              'id': const Uuid().v4(),
              'type': 'container',
              'props': {
                'colorTheme': '#FFFFFFFF',
                'elevation': 2.0,
                'borderRadius': 8.0,
              },
              'child': {
                'type': 'column',
                'props': {
                  'mainAxis': 'center',
                  'crossAxis': 'center',
                },
                'children': [
                  {
                    'type': 'icon',
                    'props': {
                      'icon': 'grid',
                      'size': 32,
                      'colorTheme': '#FF212121'
                    }
                  },
                  {
                    'type': 'text',
                    'props': {
                      'data': 'Grid Item ${index + 1}',
                      'style': {'fontSize': 16, 'fontWeight': 'w500'}
                    }
                  }
                ]
              }
            })).toList()
  }
};
