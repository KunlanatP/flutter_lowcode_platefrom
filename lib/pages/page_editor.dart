import 'package:flutter/material.dart';

class PageEditor extends StatefulWidget {
  const PageEditor({super.key});

  @override
  _PageEditorState createState() => _PageEditorState();
}

class _PageEditorState extends State<PageEditor> {
  final Color primaryBlue = const Color(0xFF2563EB);
  final Color lightBlue = const Color(0xFFEFF6FF);
  int _selectedToggleIndex = 1;

  // Function to get content based on the selected toggle index
  Widget _getContent() {
    switch (_selectedToggleIndex) {
      case 0:
        return Text(
          'Home Content',
          style: TextStyle(fontSize: 24, color: primaryBlue),
        );
      case 1:
        return EditContent(
          primaryBlue: primaryBlue,
          lightBlue: lightBlue,
        );
      case 2:
        return Text(
          'Settings Content',
          style: TextStyle(fontSize: 24, color: primaryBlue),
        );
      default:
        return Text(
          'Page Editor Content Here',
          style: TextStyle(fontSize: 24, color: primaryBlue),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              // color: Colors.white,
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Logo on the left
                SizedBox(
                  width: 40,
                  child: Image.asset('assets/logo.png', fit: BoxFit.contain),
                ),
                const Spacer(),
                // Center ToggleButtons
                ToggleButtons(
                  borderColor: Colors.transparent,
                  selectedBorderColor: primaryBlue,
                  selectedColor: Colors.white,
                  fillColor: primaryBlue,
                  color: primaryBlue,
                  isSelected: [
                    _selectedToggleIndex == 0,
                    _selectedToggleIndex == 1,
                    _selectedToggleIndex == 2,
                  ],
                  onPressed: (int index) {
                    setState(() {
                      _selectedToggleIndex = index;
                    });
                  },
                  borderRadius: BorderRadius.circular(30),
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(Icons.home),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(Icons.edit),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(Icons.settings),
                    ),
                  ],
                ),
                const Spacer(),
                // Logout Button
                IconButton(
                  icon: Icon(Icons.logout, color: primaryBlue),
                  onPressed: () {
                    Navigator.of(context).pop(); // Go back to the home page
                  },
                  tooltip: 'Logout',
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: _getContent(), // Display content based on the toggle index
            ),
          ),
        ],
      ),
    );
  }
}

class EditContent extends StatefulWidget {
  final Color primaryBlue;
  final Color lightBlue;

  const EditContent({
    super.key,
    required this.primaryBlue,
    required this.lightBlue,
  });

  @override
  _EditContentState createState() => _EditContentState();
}

class _EditContentState extends State<EditContent> {
  int _selectedTabIndex = 0;

  // Function to get content based on the selected tab index
  Widget _getTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return Text(
          'Dashboard Content',
          style: TextStyle(fontSize: 18, color: widget.primaryBlue),
        );
      case 1:
        return Text(
          'Profile Content',
          style: TextStyle(fontSize: 18, color: widget.primaryBlue),
        );
      case 2:
        return Text(
          'Messages Content',
          style: TextStyle(fontSize: 18, color: widget.primaryBlue),
        );
      case 3:
        return Text(
          'Settings Content',
          style: TextStyle(fontSize: 18, color: widget.primaryBlue),
        );
      case 4:
        return Text(
          'Help Content',
          style: TextStyle(fontSize: 18, color: widget.primaryBlue),
        );
      default:
        return Text(
          'Select a Tab',
          style: TextStyle(fontSize: 18, color: widget.primaryBlue),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left Sidebar with Icon-only Tabs in a 48x48 Container
        Container(
          width: 280 + 48,
          child: Row(
            children: [
              Container(
                width: 60,
                color: widget.primaryBlue.withOpacity(0.1),
                child: Column(
                  children: [
                    _buildTab(icon: Icons.dashboard, index: 0),
                    _buildTab(icon: Icons.person, index: 1),
                    _buildTab(icon: Icons.message, index: 2),
                    _buildTab(icon: Icons.settings, index: 3),
                    _buildTab(icon: Icons.help, index: 4),
                  ],
                ),
              ),
              // canvas Content
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Edit Content - ${[
                          "Dashboard",
                          "Profile",
                          "Messages",
                          "Settings",
                          "Help"
                        ][_selectedTabIndex]}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: widget.primaryBlue,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _getTabContent(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: Center(
            child: Text(
              'Content',
              style: TextStyle(fontSize: 24, color: widget.primaryBlue),
            ),
          ),
        ),

        // Right Sidebar
        Container(
          width: 100,
          color: widget.primaryBlue.withOpacity(0.1),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(Icons.settings, color: widget.primaryBlue),
              const SizedBox(height: 20),
              Icon(Icons.analytics, color: widget.primaryBlue),
              const SizedBox(height: 20),
              Icon(Icons.notifications, color: widget.primaryBlue),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTab({
    required IconData icon,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        width: 48,
        height: 48,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: _selectedTabIndex == index
              ? widget.primaryBlue
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: _selectedTabIndex == index ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
