import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vrouter/vrouter.dart';

main() {
  testWidgets('VNesterPage pop', (tester) async {
    await tester.pumpWidget(
      VRouter(
        initialUrl: '/settings',
        routes: [
          VWidget(
            path: '/',
            widget: const Text('VWidget1'),
            stackedRoutes: [
              VNesterPage(
                path: null,
                aliases: ['scaffold'],
                pageBuilder: (key, child, name) =>
                    MaterialPage(key: key, child: child, name: name),
                widgetBuilder: (child) => Scaffold(
                  appBar: AppBar(title: const Text('Scaffold VNesterPage')),
                  body: child,
                ),
                nestedRoutes: [
                  VWidget(
                    path: '/settings',
                    widget: Builder(
                      builder: (context) {
                        return OutlinedButton(
                          onPressed: () => VRouter.of(context).pop(),
                          child: const Text('VWidget2'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    await tester.pumpAndSettle();
    final vWidget1Finder = find.text('VWidget1');
    final vWidget2Finder = find.text('VWidget2');
    final vWidget3Finder = find.text('VWidget3');
    final vNesterFinder = find.text('Scaffold VNesterPage');

    // At first we are on '/other'

    // Now, only VWidget2 should be visible
    expect(vWidget1Finder, findsNothing);
    expect(vNesterFinder, findsOneWidget);
    expect(vWidget2Finder, findsOneWidget);
    expect(vWidget3Finder, findsNothing);

    // Pop to '/'
    // Tap the add button.
    await tester.tap(find.byType(OutlinedButton));
    await tester.pumpAndSettle();

    // Now, only VWidget2 should be visible
    expect(vWidget1Finder, findsOneWidget);
    expect(vNesterFinder, findsNothing);
    expect(vWidget2Finder, findsNothing);
    expect(vWidget3Finder, findsNothing);
  });
  testWidgets('VNesterPage vanilla navigator pop', (tester) async {
    await tester.pumpWidget(
      VRouter(
        initialUrl: '/settings',
        routes: [
          VWidget(
            path: '/',
            widget: const Text('VWidget1'),
            stackedRoutes: [
              VNesterPage(
                path: null,
                aliases: ['scaffold'],
                pageBuilder: (key, child, name) =>
                    MaterialPage(key: key, child: child, name: name),
                widgetBuilder: (child) => Scaffold(
                  appBar: AppBar(title: const Text('Scaffold VNesterPage')),
                  body: child,
                ),
                nestedRoutes: [
                  VWidget(
                    path: '/settings',
                    widget: Builder(
                      builder: (context) {
                        return OutlinedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('VWidget2'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    await tester.pumpAndSettle();

    // At first we are on '/other'

    // Now, only VWidget2 should be visible
    final vWidget1Finder = find.text('VWidget1');
    final vWidget2Finder = find.text('VWidget2');
    final vWidget3Finder = find.text('VWidget3');
    final vNesterFinder = find.text('Scaffold VNesterPage');

    expect(vWidget1Finder, findsNothing);
    expect(vNesterFinder, findsOneWidget);
    expect(vWidget2Finder, findsOneWidget);
    expect(vWidget3Finder, findsNothing);

    // Pop to '/'
    // Tap the add button.
    await tester.tap(find.byType(OutlinedButton));
    await tester.pumpAndSettle();

    // Now, only VWidget2 should be visible

    expect(vWidget1Finder, findsOneWidget);
    expect(vNesterFinder, findsNothing);
    expect(vWidget2Finder, findsNothing);
    expect(vWidget3Finder, findsNothing);
  });

  testWidgets('VNesterPage systemPop', (tester) async {
    await tester.pumpWidget(
      VRouter(
        initialUrl: '/settings',
        routes: [
          VWidget(
            path: '/',
            widget: const Text('VWidget1'),
            stackedRoutes: [
              VNesterPage(
                path: null,
                aliases: ['scaffold'],
                pageBuilder: (key, child, name) =>
                    MaterialPage(key: key, child: child, name: name),
                widgetBuilder: (child) => Scaffold(
                  appBar: AppBar(title: const Text('Scaffold VNesterPage')),
                  body: child,
                ),
                nestedRoutes: [
                  VWidget(
                    path: '/settings',
                    widget: Builder(
                      builder: (context) {
                        return OutlinedButton(
                          onPressed: () => VRouter.of(context).systemPop(),
                          child: const Text('VWidget2'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    await tester.pumpAndSettle();

    // At first we are on '/other'

    // Now, only VWidget2 should be visible
    final vWidget1Finder = find.text('VWidget1');
    final vWidget2Finder = find.text('VWidget2');
    final vWidget3Finder = find.text('VWidget3');
    final vNesterFinder = find.text('Scaffold VNesterPage');

    expect(vWidget1Finder, findsNothing);
    expect(vNesterFinder, findsOneWidget);
    expect(vWidget2Finder, findsOneWidget);
    expect(vWidget3Finder, findsNothing);

    // Pop to '/'
    // Tap the add button.
    await tester.tap(find.byType(OutlinedButton));
    await tester.pumpAndSettle();

    // Now, only VWidget2 should be visible

    expect(vWidget1Finder, findsOneWidget);
    expect(vNesterFinder, findsNothing);
    expect(vWidget2Finder, findsNothing);
    expect(vWidget3Finder, findsNothing);
  });

  testWidgets('VNesterPage pop on alias', (tester) async {
    await tester.pumpWidget(
      VRouter(
        routes: [
          VWidget(
            path: '/',
            widget: Builder(
              builder: (context) {
                return Scaffold(
                  body: const Text('VWidget1'),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () => VRouter.of(context).to('/other'),
                  ),
                );
              },
            ),
            stackedRoutes: [
              VNesterPage(
                path: ':id(\d+)',
                aliases: ['/settings'],
                pageBuilder: (key, child, name) =>
                    MaterialPage(key: key, child: child, name: name),
                widgetBuilder: (child) => Builder(
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(title: const Text('Scaffold VNesterPage')),
                      body: child,
                    );
                  },
                ),
                nestedRoutes: [
                  VWidget(
                    path: null,
                    widget: Builder(
                      builder: (context) {
                        return OutlinedButton(
                          onPressed: () => VRouter.of(context).pop(),
                          child: const Text('VWidget2'),
                        );
                      },
                    ),
                    stackedRoutes: [
                      VWidget(
                        path: '/other',
                        widget: Builder(
                          builder: (context) {
                            return OutlinedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('VWidget3'),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    await tester.pumpAndSettle();

    // At first we are on "/" so only VWidget1 should be shown

    final vWidget1Finder = find.text('VWidget1');
    final vWidget2Finder = find.text('VWidget2');
    final vWidget3Finder = find.text('VWidget3');
    final vNesterFinder = find.text('Scaffold VNesterPage');

    expect(vWidget1Finder, findsOneWidget);
    expect(vNesterFinder, findsNothing);
    expect(vWidget2Finder, findsNothing);
    expect(vWidget3Finder, findsNothing);

    // Navigate to '/other'
    // Tap the add button.
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Now, only VWidget2 should be visible

    expect(vWidget1Finder, findsNothing);
    expect(vNesterFinder, findsOneWidget);
    expect(vWidget2Finder, findsNothing);
    expect(vWidget3Finder, findsOneWidget);

    // Pop to '/settings'
    // Tap the add button.
    await tester.tap(find.byType(OutlinedButton));
    await tester.pumpAndSettle();

    // Now, only VWidget2 should be visible

    expect(vWidget1Finder, findsNothing);
    expect(vNesterFinder, findsOneWidget);
    expect(vWidget2Finder, findsOneWidget);
    expect(vWidget3Finder, findsNothing);

    // Pop to '/'
    // Tap the add button.
    await tester.tap(find.byType(OutlinedButton));
    await tester.pumpAndSettle();

    // Now, only VWidget2 should be visible

    expect(vWidget1Finder, findsOneWidget);
    expect(vNesterFinder, findsNothing);
    expect(vWidget2Finder, findsNothing);
    expect(vWidget3Finder, findsNothing);
  });

  testWidgets('VNesterPage with stacked route', (tester) async {
    await tester.pumpWidget(
      VRouter(
        routes: [
          VWidget(
            path: '/',
            widget: Builder(
              builder: (context) {
                return Scaffold(
                  body: const Text('VWidget1'),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () => VRouter.of(context).to('/settings/other'),
                  ),
                );
              },
            ),
            stackedRoutes: [
              VNesterPage(
                path: '/settings',
                pageBuilder: (key, child, name) =>
                    MaterialPage(key: key, child: child, name: name),
                widgetBuilder: (child) => Builder(
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(title: const Text('Scaffold VNesterPage')),
                      body: child,
                    );
                  },
                ),
                nestedRoutes: [
                  VWidget(
                    path: null,
                    aliases: [':_(.*)'],
                    widget: Builder(
                      builder: (context) {
                        return OutlinedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('VWidget2'),
                        );
                      },
                    ),
                  ),
                ],
                stackedRoutes: [
                  VWidget(
                    path: 'other',
                    widget: Builder(
                      builder: (context) {
                        return OutlinedButton(
                          onPressed: () => VRouter.of(context).pop(),
                          child: const Text('VWidget3'),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );

    await tester.pumpAndSettle();

    // At first we are on "/" so only VWidget1 should be shown

    final vWidget1Finder = find.text('VWidget1');
    final vWidget2Finder = find.text('VWidget2');
    final vWidget3Finder = find.text('VWidget3');
    final vNesterFinder = find.text('Scaffold VNesterPage');

    expect(vWidget1Finder, findsOneWidget);
    expect(vNesterFinder, findsNothing);
    expect(vWidget2Finder, findsNothing);
    expect(vWidget3Finder, findsNothing);

    // Navigate to '/settings/other'
    // Tap the add button.
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Now, only VWidget2 should be visible

    expect(vWidget1Finder, findsNothing);
    expect(vNesterFinder, findsNothing);
    expect(vWidget2Finder, findsNothing);
    expect(vWidget3Finder, findsOneWidget);

    // Pop to '/settings'
    // Tap the add button.
    await tester.tap(find.byType(OutlinedButton));
    await tester.pumpAndSettle();

    // Now, only VWidget2 should be visible

    expect(vWidget1Finder, findsNothing);
    expect(vNesterFinder, findsOneWidget);
    expect(vWidget2Finder, findsOneWidget);
    expect(vWidget3Finder, findsNothing);

    // Pop to '/'
    // Tap the add button.
    await tester.tap(find.byType(OutlinedButton));
    await tester.pumpAndSettle();

    // Now, only VWidget2 should be visible

    expect(vWidget1Finder, findsOneWidget);
    expect(vNesterFinder, findsNothing);
    expect(vWidget2Finder, findsNothing);
    expect(vWidget3Finder, findsNothing);
  });

  testWidgets('VNesterPage named', (tester) async {
    await tester.pumpWidget(
      VRouter(
        routes: [
          VWidget(
            path: '/',
            widget: Builder(
              builder: (context) {
                return Scaffold(
                  body: const Text('VWidget1'),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () => VRouter.of(context).toNamed('settings'),
                  ),
                );
              },
            ),
            stackedRoutes: [
              VNesterPage(
                path: '/settings',
                name: 'settings',
                pageBuilder: (key, child, name) =>
                    MaterialPage(key: key, child: child, name: name),
                widgetBuilder: (child) => Builder(
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(title: const Text('Scaffold VNesterPage')),
                      body: child,
                    );
                  },
                ),
                nestedRoutes: [
                  VWidget(
                    path: null,
                    widget: const Text('VWidget2'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    await tester.pumpAndSettle();

    // At first we are on "/" so only VWidget1 should be shown

    final vWidget1Finder = find.text('VWidget1');
    final vWidget2Finder = find.text('VWidget2');
    final vNesterFinder = find.text('Scaffold VNesterPage');

    expect(vWidget1Finder, findsOneWidget);
    expect(vNesterFinder, findsNothing);
    expect(vWidget2Finder, findsNothing);

    // Navigate to '/settings' by name
    // Tap the add button.
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Now, only VWidget2 should be visible

    expect(vWidget1Finder, findsNothing);
    expect(vNesterFinder, findsOneWidget);
    expect(vWidget2Finder, findsOneWidget);
  });

  testWidgets('VNesterPage name in nestedRoutes', (tester) async {
    await tester.pumpWidget(
      VRouter(
        routes: [
          VWidget(
            path: '/',
            widget: Builder(
              builder: (context) {
                return Scaffold(
                  body: const Text('VWidget1'),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () => VRouter.of(context).toNamed('settings'),
                  ),
                );
              },
            ),
            stackedRoutes: [
              VNesterPage(
                path: '/settings',
                pageBuilder: (key, child, name) =>
                    MaterialPage(key: key, child: child, name: name),
                widgetBuilder: (child) => Builder(
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(title: const Text('Scaffold VNesterPage')),
                      body: child,
                    );
                  },
                ),
                nestedRoutes: [
                  VWidget(
                    path: null,
                    name: 'settings',
                    widget: const Text('VWidget2'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    await tester.pumpAndSettle();

    // At first we are on "/" so only VWidget1 should be shown

    final vWidget1Finder = find.text('VWidget1');
    final vWidget2Finder = find.text('VWidget2');
    final vNesterFinder = find.text('Scaffold VNesterPage');

    expect(vWidget1Finder, findsOneWidget);
    expect(vNesterFinder, findsNothing);
    expect(vWidget2Finder, findsNothing);

    // Navigate to '/settings' by name
    // Tap the add button.
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Now, only VWidget2 should be visible

    expect(vWidget1Finder, findsNothing);
    expect(vNesterFinder, findsOneWidget);
    expect(vWidget2Finder, findsOneWidget);
  });

  testWidgets('VNesterPage name in stackedRoutes', (tester) async {
    await tester.pumpWidget(
      VRouter(
        routes: [
          VWidget(
            path: '/',
            widget: Builder(
              builder: (context) {
                return Scaffold(
                  body: const Text('VWidget1'),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () => VRouter.of(context).toNamed('settings'),
                  ),
                );
              },
            ),
            stackedRoutes: [
              VNesterPage(
                path: '/settings',
                pageBuilder: (key, child, name) =>
                    MaterialPage(key: key, child: child, name: name),
                widgetBuilder: (child) => Builder(
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(title: const Text('Scaffold VNesterPage')),
                      body: child,
                    );
                  },
                ),
                nestedRoutes: [
                  VWidget(
                    path: null,
                    widget: const Text('VWidget2'),
                  ),
                ],
                stackedRoutes: [
                  VWidget(
                    path: null,
                    name: 'settings',
                    widget: const Text('VWidget3'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    await tester.pumpAndSettle();
    final vWidget1Finder = find.text('VWidget1');
    final vWidget2Finder = find.text('VWidget2');
    final vWidget3Finder = find.text('VWidget3');
    final vNesterFinder = find.text('Scaffold VNesterPage');

    // At first we are on "/" so only VWidget1 should be shown
    expect(vWidget1Finder, findsOneWidget);
    expect(vNesterFinder, findsNothing);
    expect(vWidget2Finder, findsNothing);
    expect(vWidget3Finder, findsNothing);

    // Navigate to '/settings' by name
    // Tap the add button.
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Now, only VWidget2 should be visible
    expect(vWidget1Finder, findsNothing);
    expect(vNesterFinder, findsNothing);
    expect(vWidget2Finder, findsNothing);
    expect(vWidget3Finder, findsOneWidget);
  });

  testWidgets('VNesterPage named with alias default',
      (tester) async {
    await tester.pumpWidget(
      VRouter(
        routes: [
          VWidget(
            path: '/',
            widget: Builder(
              builder: (context) {
                return Scaffold(
                  body: const Text('VWidget1'),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () => VRouter.of(context).toNamed('settings'),
                  ),
                );
              },
            ),
            stackedRoutes: [
              VNesterPage(
                path: '/:id',
                name: 'settings',
                aliases: ['/settings'],
                pageBuilder: (key, child, name) =>
                    MaterialPage(key: key, child: child, name: name),
                widgetBuilder: (child) => Builder(
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(title: const Text('Scaffold VNesterPage')),
                      body: child,
                    );
                  },
                ),
                nestedRoutes: [
                  VWidget(
                    path: null,
                    widget: const Text('VWidget2'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    await tester.pumpAndSettle();

    // At first we are on "/" so only VWidget1 should be shown

    final vWidget1Finder = find.text('VWidget1');
    final vWidget2Finder = find.text('VWidget2');
    final vNesterFinder = find.text('Scaffold VNesterPage');

    expect(vWidget1Finder, findsOneWidget);
    expect(vNesterFinder, findsNothing);
    expect(vWidget2Finder, findsNothing);

    // Navigate to '/settings' by name
    // Tap the add button.
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Now, only VWidget2 should be visible

    expect(vWidget1Finder, findsNothing);
    expect(vNesterFinder, findsOneWidget);
    expect(vWidget2Finder, findsOneWidget);
  });

  testWidgets('VNesterPage with alias', (tester) async {
    await tester.pumpWidget(
      VRouter(
        routes: [
          VWidget(
            path: '/',
            widget: Builder(
              builder: (context) {
                return Scaffold(
                  body: const Text('VWidget1'),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () => VRouter.of(context).to('/settings/2'),
                  ),
                );
              },
            ),
            stackedRoutes: [
              VNesterPage(
                path: '/settings',
                aliases: ['/settings/:id'],
                pageBuilder: (key, child, name) =>
                    MaterialPage(key: key, child: child, name: name),
                widgetBuilder: (child) => Builder(
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(title: const Text('Scaffold VNesterPage')),
                      body: child,
                    );
                  },
                ),
                nestedRoutes: [
                  VWidget(
                    path: null,
                    widget: const Text('VWidget2'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    await tester.pumpAndSettle();

    // At first we are on "/" so only VWidget1 should be shown

    final vWidget1Finder = find.text('VWidget1');
    final vWidget2Finder = find.text('VWidget2');
    final vNesterFinder = find.text('Scaffold VNesterPage');

    expect(vWidget1Finder, findsOneWidget);
    expect(vNesterFinder, findsNothing);
    expect(vWidget2Finder, findsNothing);

    // Navigate to '/settings/2' by to
    // Tap the add button.
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Now, only VWidget2 should be visible
    expect(vWidget1Finder, findsNothing);
    expect(vNesterFinder, findsOneWidget);
    expect(vWidget2Finder, findsOneWidget);
  });

  testWidgets('VNesterPage pop in nested route', (tester) async {
    await tester.pumpWidget(
      VRouter(
        initialUrl: '/other',
        routes: [
          VWidget(
            path: '/',
            widget: const Text('VWidget1'),
            stackedRoutes: [
              VNesterPage(
                path: null,
                aliases: ['scaffold'],
                pageBuilder: (key, child, name) =>
                    MaterialPage(key: key, child: child, name: name),
                widgetBuilder: (child) => Scaffold(
                  appBar: AppBar(title: const Text('Scaffold VNesterPage')),
                  body: child,
                ),
                nestedRoutes: [
                  VWidget(
                    path: '/settings',
                    widget: const Text('VWidget2'),
                    stackedRoutes: [
                      VWidget(
                        path: '/other',
                        widget: Builder(
                          builder: (context) {
                            return OutlinedButton(
                              onPressed: () => context.vRouter.pop(),
                              child: const Text('VWidget3'),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    await tester.pumpAndSettle();

    // '/other' is the initial url

    // Now, only VWidget2 should be visible
    final vWidget1Finder = find.text('VWidget1');
    final vWidget2Finder = find.text('VWidget2');
    final vWidget3Finder = find.text('VWidget3');
    final vNesterFinder = find.text('Scaffold VNesterPage');

    expect(vWidget1Finder, findsNothing);
    expect(vNesterFinder, findsOneWidget);
    expect(vWidget2Finder, findsNothing);
    expect(vWidget3Finder, findsOneWidget);

    // Pop to '/settings'
    // Tap the add button.
    await tester.tap(find.byType(OutlinedButton));
    await tester.pumpAndSettle();

    // Now, only VWidget2 should be visible
    expect(vWidget1Finder, findsNothing);
    expect(vNesterFinder, findsOneWidget);
    expect(vWidget2Finder, findsOneWidget);
    expect(vWidget3Finder, findsNothing);
  });

  testWidgets('VNesterPage vanilla Navigator pop in nested route',
      (tester) async {
    await tester.pumpWidget(
      VRouter(
        initialUrl: '/other',
        routes: [
          VWidget(
            path: '/',
            widget: const Text('VWidget1'),
            stackedRoutes: [
              VNesterPage(
                path: null,
                aliases: ['scaffold'],
                pageBuilder: (key, child, name) =>
                    MaterialPage(key: key, child: child, name: name),
                widgetBuilder: (child) => Scaffold(
                  appBar: AppBar(title: const Text('Scaffold VNesterPage')),
                  body: child,
                ),
                nestedRoutes: [
                  VWidget(
                    path: '/settings',
                    widget: const Text('VWidget2'),
                    stackedRoutes: [
                      VWidget(
                        path: '/other',
                        widget: Builder(
                          builder: (context) {
                            return OutlinedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('VWidget3'),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    await tester.pumpAndSettle();

    // '/other' is the initial url

    // Now, only VWidget2 should be visible
    final vWidget1Finder = find.text('VWidget1');
    final vWidget2Finder = find.text('VWidget2');
    final vWidget3Finder = find.text('VWidget3');
    final vNesterFinder = find.text('Scaffold VNesterPage');

    expect(vWidget1Finder, findsNothing);
    expect(vNesterFinder, findsOneWidget);
    expect(vWidget2Finder, findsNothing);
    expect(vWidget3Finder, findsOneWidget);

    // Pop to '/settings'
    // Tap the add button.
    await tester.tap(find.byType(OutlinedButton));
    await tester.pumpAndSettle();

    // Now, only VWidget2 should be visible
    expect(vWidget1Finder, findsNothing);
    expect(vNesterFinder, findsOneWidget);
    expect(vWidget2Finder, findsOneWidget);
    expect(vWidget3Finder, findsNothing);
  });

  testWidgets('VNesterPage systemPop in nested route',
      (tester) async {
    await tester.pumpWidget(
      VRouter(
        initialUrl: '/other',
        routes: [
          VWidget(
            path: '/',
            widget: const Text('VWidget1'),
            stackedRoutes: [
              VNesterPage(
                path: null,
                aliases: ['scaffold'],
                pageBuilder: (key, child, name) =>
                    MaterialPage(key: key, child: child, name: name),
                widgetBuilder: (child) => Scaffold(
                  appBar: AppBar(title: const Text('Scaffold VNesterPage')),
                  body: child,
                ),
                nestedRoutes: [
                  VWidget(
                    path: '/settings',
                    widget: const Text('VWidget2'),
                    stackedRoutes: [
                      VWidget(
                        path: '/other',
                        widget: Builder(
                          builder: (context) {
                            return OutlinedButton(
                              onPressed: () => context.vRouter.systemPop(),
                              child: const Text('VWidget3'),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    await tester.pumpAndSettle();

    // '/other' is the initial url

    // Now, only VWidget2 should be visible
    final vWidget1Finder = find.text('VWidget1');
    final vWidget2Finder = find.text('VWidget2');
    final vWidget3Finder = find.text('VWidget3');
    final vNesterFinder = find.text('Scaffold VNesterPage');

    expect(vWidget1Finder, findsNothing);
    expect(vNesterFinder, findsOneWidget);
    expect(vWidget2Finder, findsNothing);
    expect(vWidget3Finder, findsOneWidget);

    // Pop to '/settings'
    // Tap the add button.
    await tester.tap(find.byType(OutlinedButton));
    await tester.pumpAndSettle();

    // Now, only VWidget2 should be visible
    expect(vWidget1Finder, findsNothing);
    expect(vNesterFinder, findsOneWidget);
    expect(vWidget2Finder, findsOneWidget);
    expect(vWidget3Finder, findsNothing);
  });
}
