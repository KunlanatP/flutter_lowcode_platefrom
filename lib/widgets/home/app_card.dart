import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Map<String, dynamic> app;

  const AppCard({required this.app, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(app['icon'], size: 28, color: Theme.of(context).primaryColor),
          const SizedBox(height: 4),
          Text(
            app['app_name'],
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'v${app['app_version']}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
