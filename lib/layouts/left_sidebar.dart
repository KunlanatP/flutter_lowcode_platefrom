import 'package:flutter/material.dart';

import '../../../utils/other.dart';

class LeftSidebar extends StatefulWidget {
  const LeftSidebar({super.key});

  @override
  State<LeftSidebar> createState() => _LeftSidebarState();
}

class _LeftSidebarState extends State<LeftSidebar> {
  final Color primaryBlue = const Color(0xFF2563EB);
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SIDEBAR_SIZE + TOOLBAR_SIZE,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[900]
                  : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildModernTab(
                  icon: Icons.dashboard_rounded,
                  label: 'Dashboard',
                  index: 0,
                ),
                _buildModernTab(
                  icon: Icons.person_rounded,
                  label: 'Profile',
                  index: 1,
                ),
                _buildModernTab(
                  icon: Icons.message_rounded,
                  label: 'Messages',
                  index: 2,
                ),
                _buildModernTab(
                  icon: Icons.settings_rounded,
                  label: 'Settings',
                  index: 3,
                ),
                _buildModernTab(
                  icon: Icons.help_rounded,
                  label: 'Help',
                  index: 4,
                ),
              ],
            ),
          ),
          // Rest of your existing content
          // Left sidebar Content
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.grey.shade300,
              padding: const EdgeInsets.all(20),
              child: _getTabContent(),
            ),
          ),
        ],
      ),
    );
  }

  // Function to get content based on the selected tab index
  Widget _getTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return Text(
          'Dashboard Content',
          style: TextStyle(fontSize: 18, color: primaryBlue),
        );
      case 1:
        return Text(
          'Profile Content',
          style: TextStyle(fontSize: 18, color: primaryBlue),
        );
      case 2:
        return Text(
          'Messages Content',
          style: TextStyle(fontSize: 18, color: primaryBlue),
        );
      case 3:
        return Text(
          'Settings Content',
          style: TextStyle(fontSize: 18, color: primaryBlue),
        );
      case 4:
        return Text(
          'Help Content',
          style: TextStyle(fontSize: 18, color: primaryBlue),
        );
      default:
        return Text(
          'Select a Tab',
          style: TextStyle(fontSize: 18, color: primaryBlue),
        );
    }
  }

  // Add this new method to your _EditContentState class
  Widget _buildModernTab({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = _selectedTabIndex == index;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Tooltip(
      message: label,
      preferBelow: false,
      child: InkWell(
        onTap: () => setState(() => _selectedTabIndex = index),
        child: Container(
          width: 48,
          height: 48,
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isSelected
                ? (isDark
                    ? primaryBlue.withOpacity(0.6)
                    : primaryBlue.withOpacity(0.2))
                : Colors.transparent,
            // borderRadius: BorderRadius.circular(12),
          ),
          child: AnimatedScale(
            scale: isSelected ? 1.1 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: Icon(
              icon,
              size: 22,
              color: isSelected
                  ? (isDark ? Colors.white : primaryBlue)
                  : (isDark ? Colors.grey[400] : Colors.grey[600]),
            ),
          ),
        ),
      ),
    );
  }
}
