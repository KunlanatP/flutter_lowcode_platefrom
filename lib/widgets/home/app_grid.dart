import 'package:flutter/material.dart';

import 'app_card.dart';

class AppGrid extends StatelessWidget {
  final List<Map<String, dynamic>> apps;
  
  const AppGrid({required this.apps, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          childAspectRatio: 1.2,
        ),
        itemCount: apps.length,
        itemBuilder: (context, index) => AppCard(app: apps[index]),
      ),
    );
  }
}
