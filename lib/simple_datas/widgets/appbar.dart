import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class SimpleAppBarWidget extends StatelessWidget {
  const SimpleAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(),
      body: Center(
        child: Text("Modern AppBar UI"),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Remove elevation for a flat look
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E88E5), Color(0xFF1976D2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          children: [
            // Profile avatar on the left
            const CircleAvatar(
              backgroundImage: NetworkImage(
                "https://www.example.com/profile.jpg",
              ),
              radius: 20,
            ),
            const SizedBox(width: 12),
            // Search bar in the center
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        // Notification icon
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.white),
          onPressed: () {
            // Handle notification tap
          },
        ),
        // Settings icon
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.white),
          onPressed: () {
            // Handle settings tap
          },
        ),
      ],
    );
  }
}

final appBarWidget = {
  "id": const Uuid().v4(),
  "type": "scaffold",
  "props": {"colorTheme": "#FFF4F4F3"},
  "appBar": {
    "actions": [
      {
        "id": const Uuid().v4(),
        "props": {
          "colorTheme": "#FF212121",
          "icon": {
            "colorTheme": "#FF212121",
            "data": "more_vertical",
            "size": 24,
            "theme": "regular"
          }
        },
        "title": "icon",
        "type": "icon"
      }
    ],
    "appbarTitle": {
      "type": "text",
      "props": {
        "data": "Hello",
        "softWrap": true,
        "maxLines": "1",
        "textAlign": "left",
        "alignment": "center",
        "style": {
          "fontFamily": "Abel",
          "fontSize": 34,
          "fontWeight": "w400",
          "letterSpacing": 0.25,
          "fontStyle": "normal",
          "decoration": "none",
          "colorTheme": "#FFF4F4F3"
        }
      }
    },
    "id": const Uuid().v4(),
    "props": {
      "centerTitle": false,
      "colorTheme": "#FFFFFFFF",
      "elevation": 0,
      "showDefaultButton": true
    },
    "title": "appbar",
    "type": "appbar"
  },
  "body": {
    "id": const Uuid().v4(),
    "type": "text",
    "props": {
      "data": "Hello, World!",
      "softWrap": true,
      "maxLines": "1",
      "textAlign": "left",
      "style": {
        "fontFamily": "Abel",
        "fontSize": 34,
        "fontWeight": "w400",
        "letterSpacing": 0.25,
        "fontStyle": "normal",
        "decoration": "none",
        "colorTheme": "#FF800000",
      },
    }
  }
};
