import 'package:flutter/material.dart';
import 'package:flutter_lowcode_plateform/states/home/app_state.dart';
import 'package:flutter_lowcode_plateform/states/page/page_state.dart';
import 'package:flutter_lowcode_plateform/widgets/home/create_app_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrouter/vrouter.dart';

import '../../layouts/navbar_toolbar.dart';
import '../../widgets/home/app_list.dart';

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
  void didChangeDependencies() {
    ref.read(appController).init();
    ref.read(pageController).init();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? lightBlue
          : Colors.grey[900],
      body: Column(
        children: [
          Navbar(
            menus: [
              _buildSearchSection(),
              const SizedBox(width: 16),
              _buildCreateAppButton(),
            ],
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
    final descController =
        TextEditingController(text: 'A new Flutter project.');
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

  Widget _buildSearchSection() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: TextField(
        onChanged: (value) async {
          await ref.read(appController).fetchAllApplications(0, 20, value);
        },
        decoration: InputDecoration(
          hintText: 'Search applications...',
          prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
          filled: true,
          fillColor: Theme.of(context).cardColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: Theme.of(context).dividerColor.withOpacity(0.1)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: Theme.of(context).dividerColor.withOpacity(0.1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }

  Widget _buildCreateAppButton() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).secondaryHeaderColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('New Application'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: _showCreateAppDialog,
      ),
    );
  }
}
