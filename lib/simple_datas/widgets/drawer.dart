import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class SimpleModelWidget extends StatefulWidget {
  const SimpleModelWidget({super.key});

  @override
  State<SimpleModelWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SimpleModelWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // Open the drawer as soon as the widget renders
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scaffoldKey.currentState?.openDrawer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Modern Drawer UI"),
        backgroundColor: const Color(0xFF1E88E5),
      ),
      drawer: ModernDrawer(),
      body: const Center(
        child: Text(
            "Swipe from left or tap the top left icon to open the drawer."),
      ),
    );
  }
}

class ModernDrawer extends StatelessWidget {
  const ModernDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF2A2D3E),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text(
                "John Doe",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "john.doe@example.com",
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey[200],
                backgroundImage:
                    const NetworkImage("https://www.example.com/profile.jpg"),
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF1E88E5),
              ),
            ),
            DrawerItem(icon: Icons.home, text: "Home", onTap: () {}),
            DrawerItem(icon: Icons.person, text: "Profile", onTap: () {}),
            DrawerItem(
                icon: Icons.notifications, text: "Notifications", onTap: () {}),
            DrawerItem(icon: Icons.settings, text: "Settings", onTap: () {}),
            Divider(color: Colors.grey[600]),
            DrawerItem(icon: Icons.logout, text: "Logout", onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final GestureTapCallback onTap;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: onTap,
    );
  }
}

final drawerWidget = {
  "id": const Uuid().v4(),
  "type": "drawer",
  "title": "drawer",
  "props": {
    "colorTheme": "#FF2A2D3E",
    "header": {
      "type": "userAccountsDrawerHeader",
      "props": {
        "accountName": "John Doe",
        "accountNameStyle": {"color": "#FFFFFFFF", "fontWeight": "bold"},
        "accountEmail": "john.doe@example.com",
        "accountEmailStyle": {"color": "#FFE0E0E0"},
        "avatarImage": "https://www.example.com/profile.jpg",
        "avatarBackgroundColor": "#FFE0E0E0",
        "headerColor": "#FF1E88E5"
      }
    },
    "menuItems": [
      {
        "type": "drawerItem",
        "props": {"icon": "home", "text": "Home", "onTap": {}}
      },
      {
        "type": "drawerItem",
        "props": {"icon": "person", "text": "Profile", "onTap": {}}
      },
      {
        "type": "drawerItem",
        "props": {"icon": "notifications", "text": "Notifications", "onTap": {}}
      },
      {
        "type": "drawerItem",
        "props": {"icon": "settings", "text": "Settings", "onTap": {}}
      },
      {
        "type": "divider",
        "props": {"color": "#FF9E9E9E"}
      },
      {
        "type": "drawerItem",
        "props": {"icon": "logout", "text": "Logout", "onTap": {}}
      }
    ],
    "padding": "zero"
  }
};
