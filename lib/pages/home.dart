import 'package:flutter/material.dart';
import 'package:flutter_lowcode_plateform/states/home/app_state.dart';
import 'package:flutter_lowcode_plateform/widgets/home/create_app_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrouter/vrouter.dart';

import '../widgets/home/app_grid.dart';
import '../widgets/home/app_header.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  final Color primaryBlue = const Color(0xFF2563EB);
  final Color secondaryBlue = const Color(0xFF1D4ED8);
  final Color lightBlue = const Color(0xFFEFF6FF);
  bool isDarkMode = false;

  @override
  void initState() {
    ref.read(appController).init();
  
    super.initState();
  }

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
            child: ApplicationList(
              onAppSelected: (appID) {
                VRouter.of(context).to('/editor/$appID');
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showCreateAppDialog() {
    final nameController = TextEditingController();
    final versionController = TextEditingController(text: '1.0.0');
    final bundleController = TextEditingController(text: 'com.example.');
    final descController = TextEditingController(text: 'A new Flutter project.');
    String selectedPlatform = 'mobile';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CreateAppDialog(
          nameController: nameController,
          versionController: versionController,
          bundleController: bundleController,
          descController: descController,
          selectedPlatform: selectedPlatform,
          onPlatformChanged: (value) {
            selectedPlatform = value;
          },
        );
      },
    );
  }
}


