import 'package:flutter/material.dart';
import 'package:flutter_lowcode_plateform/widgets/home/create_app_dialog.dart';

import '../widgets/home/app_grid.dart';
import '../widgets/home/app_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color primaryBlue = const Color(0xFF2563EB);
  final Color secondaryBlue = const Color(0xFF1D4ED8);
  final Color lightBlue = const Color(0xFFEFF6FF);
  bool isDarkMode = false;

  final List<Map<String, dynamic>> apps = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
      body: Column(
        children: [
          AppHeader(
            primaryBlue: primaryBlue,
            lightBlue: lightBlue,
            onCreateApp: _showCreateAppDialog,
          ),
          Expanded(
            child: AppGrid(apps: apps),
          ),
        ],
      ),
    );
  }

  void _showCreateAppDialog() {
    final nameController = TextEditingController();
    final versionController = TextEditingController(text: '1.0.0');
    final namespaceController = TextEditingController(text: 'com.example.');
    String selectedPlatform = 'mobile';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CreateAppDialog(
          nameController: nameController,
          versionController: versionController,
          namespaceController: namespaceController,
          selectedPlatform: selectedPlatform,
          onPlatformChanged: (value) {
            selectedPlatform = value;
          },
        );
      },
    );
  }
}


