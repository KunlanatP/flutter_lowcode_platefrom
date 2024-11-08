import 'package:flutter/material.dart';
import 'package:flutter_lowcode_plateform/states/home/app_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as provider;

import '../../main.dart';

class AppHeader extends ConsumerStatefulWidget {
  final Color primaryBlue;
  final Color lightBlue;
  final VoidCallback onCreateApp;

  const AppHeader({
    required this.primaryBlue,
    required this.lightBlue,
    required this.onCreateApp,
    super.key,
  });

  @override
  ConsumerState<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends ConsumerState<AppHeader> {
  @override
  Widget build(BuildContext context) {
    ref.watch(appList);
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        // color: Colors.white,
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          _buildLogoSection(),
          const Spacer(),
          _buildSearchSection(),
          const SizedBox(width: 16),
          _buildCreateAppButton(),
          const SizedBox(width: 16),
          _buildThemeSwitcher(),
        ],
      ),
    );
  }

  Widget _buildLogoSection() {
    // Logo
    return SizedBox(
      width: 40,
      child: Image.asset('assets/logo.png', fit: BoxFit.contain),
    );
  }

  Widget _buildSearchSection() {
    return Flexible(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        child: TextField(
          onChanged: (value) async {
            await ref.read(appController).fetchAllApplications(0, 20, value);
          },
          decoration: InputDecoration(
            hintText: 'Search apps...',
            prefixIcon: Icon(Icons.search, color: widget.primaryBlue),
            filled: true,
            fillColor: widget.lightBlue,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCreateAppButton() {
    return ElevatedButton.icon(
      icon: const Icon(Icons.add),
      label: const Text('New Application'),
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.primaryBlue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: widget.onCreateApp,
    );
  }

  Widget _buildThemeSwitcher() {
    return provider.Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return IconButton(
          onPressed: () => themeProvider.toggleTheme(),
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return RotationTransition(
                turns: animation,
                child: ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              );
            },
            child: Icon(
              themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              key: ValueKey<bool>(themeProvider.isDarkMode),
              size: 24,
              color: Theme.of(context).primaryColor,
            ),
          ),
          tooltip: themeProvider.isDarkMode
              ? 'Switch to Light Mode'
              : 'Switch to Dark Mode',
        );
      },
    );
  }
}
