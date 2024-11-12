import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class SimpleTabbarWidget extends StatefulWidget {
  const SimpleTabbarWidget({super.key});

  @override
  State<SimpleTabbarWidget> createState() => _SimpleTabbarWidgetState();
}

class _SimpleTabbarWidgetState extends State<SimpleTabbarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modern TabBar UI"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF42A5F5), Color(0xFF1976D2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Floating TabBar with shadow
          Container(
            margin:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: const Color(0xFF1976D2),
                  borderRadius: BorderRadius.circular(30),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey[600],
                tabs: const [
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.person)),
                  Tab(icon: Icon(Icons.settings)),
                ],
              ),
            ),
          ),
          // TabBarView with smooth content display
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Center(child: Text("Home Content")),
                Center(child: Text("Profile Content")),
                Center(child: Text("Settings Content")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final tabBarWidget = {
  'id': const Uuid().v4(),
  'type': 'scaffold',
  'props': {'colorTheme': '#FFF4F4F4'},
  'body': {
    'id': const Uuid().v4(),
    'type': 'column',
    'props': {
      'crossAxis': 'center',
      'mainAxis': 'spaceAround',
      'mainAxisSize': 'max',
      'scrolling': false,
    },
    'children': [
      {
        "id": "tabbar-1",
        "type": "tabbar",
        "title": "tabbar",
        "children": [
          {
            "id": "tabs-1",
            "type": "tabs",
            "title": "tabs",
            "tabs": [
              {
                "props": {
                  "data": "Tab 1",
                },
                "id": "tab-1",
                "title": "tab",
                "type": "tab"
              },
              {
                "props": {
                  "data": "Tab 2",
                  'icon': {
                    'id': const Uuid().v4(),
                    'type': 'icon',
                    'props': {
                      'alignment': 'center',
                      'icon': {
                        'data': 'add',
                        'size': 14,
                        'theme': 'filled',
                        "iconType": "fluent",
                      },
                      'colorTheme':
                          "{\"default\":{\"primary\":{\"lightMode\":\"#FFB3261E\",\"darkMode\":\"#FFF2B8B5\"}}}",
                    },
                  },
                },
                "id": "tab-1",
                "title": "tab",
                "type": "tab"
              }
            ],
          },
          {
            "id": "tabbarviews1",
            "type": "tabbarviews",
            "title": "tabbarviews",
            "tabbarviews": [
              {
                "children": [
                  {
                    "children": [
                      {
                        "id": "tabbar1",
                        "props": {
                          "data": "Tab 1",
                          "maxLines": "1",
                          "softWrap": true,
                          "style": {
                            "colorTheme": "#FF323232",
                            "decoration": "none",
                            "fontFamily": "Roboto",
                            "fontSize": 14,
                            "fontStyle": "normal",
                            "fontWeight": "w400",
                            "letterSpacing": 0.3
                          },
                          "textAlign": "left"
                        },
                        "title": "text",
                        "type": "text"
                      }
                    ],
                    "id": "tabbar1",
                    "props": {
                      "crossAxis": "center",
                      "mainAxis": "start",
                      "mainAxisSize": "max",
                      "scrolling": false
                    },
                    "title": "column",
                    "type": "column"
                  }
                ],
                "id": "tabbar1",
                "title": "tabbarview",
                "type": "tabbarview"
              },
              {
                "children": [
                  {
                    "children": [
                      {
                        "id": "tabbar 2",
                        "props": {
                          "data": "Tab 2",
                          "maxLines": "1",
                          "softWrap": true,
                          "style": {
                            "colorTheme": "#FF323232",
                            "decoration": "none",
                            "fontFamily": "Roboto",
                            "fontSize": 14,
                            "fontStyle": "normal",
                            "fontWeight": "w400",
                            "letterSpacing": 0.3
                          },
                          "textAlign": "left"
                        },
                        "title": "text",
                        "type": "text"
                      }
                    ],
                    "id": "tabbar1",
                    "props": {
                      "crossAxis": "center",
                      "mainAxis": "start",
                      "mainAxisSize": "max",
                      "scrolling": false
                    },
                    "title": "column",
                    "type": "column"
                  }
                ],
                "id": "tabbar1",
                "title": "tabbarview",
                "type": "tabbarview"
              }
            ],
          },
        ],
        "props": {
          "isScroll": false,
          "indicatorColor": "#FF87CEEB",
          "dividerColor": "#FF87CEEB",
          "labelColor": "#FF000080",
          "labelStyle": {
            'fontFamily': 'Abel',
            'fontSize': 20,
            'fontWeight': 'w400',
            'letterSpacing': 0.25,
            'fontStyle': 'normal',
            'decoration': 'none',
          },
          "unselectedColor": "#FFFFFF00",
        },
      }
    ],
  },
};
