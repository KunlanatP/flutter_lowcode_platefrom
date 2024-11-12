import 'package:uuid/uuid.dart';

import 'package:flutter/material.dart';

class SimpleCardWidget extends StatelessWidget {
  const SimpleCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modern Card UI"),
        backgroundColor: const Color(0xFF1976D2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ModernCard(
              title: "Card Title",
              subtitle: "This is a short description of the card content.",
              imageUrl: "https://via.placeholder.com/150",
              onPress: () {
                print("Card pressed!");
              },
            ),
            ModernCard(
              title: "Another Card",
              subtitle: "This card has different content but the same style.",
              imageUrl: "https://via.placeholder.com/150",
              onPress: () {
                print("Another card pressed!");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ModernCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final VoidCallback onPress;

  const ModernCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onPress,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image section
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            // Title and Subtitle
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: onPress,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Read More"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final cardWidget = {
  'id': const Uuid().v4(),
  'type': 'scaffold',
  'props': {'colorTheme': '#FFF4F4F4'},
  'body': {
    'id': const Uuid().v4(),
    'type': 'card',
    'props': {
      'elevation': 4.0,
      'margin': {'all': 16.0},
      'shape': {'type': 'rounded', 'radius': 8.0}
    },
    'child': {
      'type': 'column',
      'children': [
        {
          'type': 'image',
          'props': {
            'src': 'https://picsum.photos/300/200',
            'fit': 'cover',
            'height': 200
          }
        },
        {
          'type': 'padding',
          'props': {'all': 16.0},
          'child': {
            'type': 'column',
            'props': {'crossAxis': 'start', 'spacing': 8.0},
            'children': [
              {
                'type': 'text',
                'props': {
                  'data': 'Card Title',
                  'style': {'fontSize': 20, 'fontWeight': 'bold'}
                }
              },
              {
                'type': 'text',
                'props': {
                  'data':
                      'This is a description of the card content that can span multiple lines.',
                  'style': {'fontSize': 14, 'color': '#FF757575'}
                }
              }
            ]
          }
        }
      ]
    }
  }
};
