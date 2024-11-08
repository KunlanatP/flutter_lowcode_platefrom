import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vrouter/vrouter.dart';

main() {
  group('VNester', () {
    testWidgets('VNester pop', (tester) async {
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
                VNester(
                  path: null,
                  aliases: ['scaffold'],
                  widgetBuilder: (child) => Builder(
                    builder: (context) {
                      return Scaffold(
                        appBar: AppBar(title: const Text('Scaffold VNester')),
                        body: child,
                      );
                    },
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
      final vNesterFinder = find.text('Scaffold VNester');

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

    testWidgets('VNester systemPop', (tester) async {
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
                      onPressed: () => VRouter.of(context).to('/settings'),
                    ),
                  );
                },
              ),
              stackedRoutes: [
                VNester(
                  path: null,
                  aliases: ['scaffold'],
                  widgetBuilder: (child) => Builder(
                    builder: (context) {
                      return Scaffold(
                        appBar: AppBar(title: const Text('Scaffold VNester')),
                        body: child,
                      );
                    },
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

      // At first we are on "/" so only VWidget1 should be shown

      final vWidget1Finder = find.text('VWidget1');
      final vWidget2Finder = find.text('VWidget2');
      final vWidget3Finder = find.text('VWidget3');
      final vNesterFinder = find.text('Scaffold VNester');

      expect(vWidget1Finder, findsOneWidget);
      expect(vNesterFinder, findsNothing);
      expect(vWidget2Finder, findsNothing);
      expect(vWidget3Finder, findsNothing);

      // Navigate to '/settings'
      // Tap the add button.
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Now, only VWidget2 should be visible
      expect(vWidget1Finder, findsNothing);
      expect(vNesterFinder, findsOneWidget);
      expect(vWidget2Finder, findsOneWidget);
      expect(vWidget3Finder, findsNothing);

      // systemPop to '/'
      // Tap the add button.
      await tester.tap(find.byType(OutlinedButton));
      await tester.pumpAndSettle();

      // Now, only VWidget1 should be visible
      expect(vWidget1Finder, findsOneWidget);
      expect(vNesterFinder, findsNothing);
      expect(vWidget2Finder, findsNothing);
      expect(vWidget3Finder, findsNothing);
    });

    testWidgets('VNester pop on alias', (tester) async {
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
                VNester(
                  path: ':id(\d+)',
                  // key: ValueKey('/settings'),
                  aliases: ['/settings'],
                  widgetBuilder: (child) => Builder(
                    builder: (context) {
                      return Scaffold(
                        appBar: AppBar(title: const Text('Scaffold VNester')),
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
      final vNesterFinder = find.text('Scaffold VNester');

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

    testWidgets('VNester with stacked route', (tester) async {
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
                      onPressed: () =>
                          VRouter.of(context).to('/settings/other'),
                    ),
                  );
                },
              ),
              stackedRoutes: [
                VNester(
                  path: '/settings',
                  widgetBuilder: (child) => Builder(
                    builder: (context) {
                      return Scaffold(
                        appBar: AppBar(title: const Text('Scaffold VNester')),
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
      final vNesterFinder = find.text('Scaffold VNester');

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

    testWidgets('VNester named', (tester) async {
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
                VNester(
                  path: '/settings',
                  name: 'settings',
                  widgetBuilder: (child) => Builder(
                    builder: (context) {
                      return Scaffold(
                        appBar: AppBar(title: const Text('Scaffold VNester')),
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
      final vNesterFinder = find.text('Scaffold VNester');

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

    testWidgets('VNester named with alias default',
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
                VNester(
                  path: '/:id',
                  name: 'settings',
                  aliases: ['/settings'],
                  widgetBuilder: (child) => Builder(
                    builder: (context) {
                      return Scaffold(
                        appBar: AppBar(title: const Text('Scaffold VNester')),
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
      final vNesterFinder = find.text('Scaffold VNester');

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

    testWidgets('VNester with alias', (tester) async {
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
                VNester(
                  path: '/settings',
                  aliases: ['/settings/:id'],
                  widgetBuilder: (child) => Builder(
                    builder: (context) {
                      return Scaffold(
                        appBar: AppBar(title: const Text('Scaffold VNester')),
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
      final vNesterFinder = find.text('Scaffold VNester');

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

    testWidgets(
        'systemPop with stack in nested stacked.\n The last element of nested stack should pop',
        (tester) async {
      final vRouterKey = GlobalKey<VRouterState>();

      await tester.pumpWidget(
        VRouter(
          key: vRouterKey,
          initialUrl: '/other',
          routes: [
            VWidget(
              path: '/',
              widget: const Text('VWidget1'),
              stackedRoutes: [
                VNester(
                  path: null,
                  aliases: ['scaffold'],
                  widgetBuilder: (child) => Scaffold(
                    appBar: AppBar(title: const Text('Scaffold VNester')),
                    body: child,
                  ),
                  nestedRoutes: [
                    VWidget(
                      path: '/settings',
                      widget: const Text('VWidget2'),
                      stackedRoutes: [
                        VWidget(
                          path: '/other',
                          widget: const Text('VWidget3'),
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

      final vWidget1Finder = find.text('VWidget1');
      final vWidget2Finder = find.text('VWidget2');
      final vWidget3Finder = find.text('VWidget3');
      final vNesterFinder = find.text('Scaffold VNester');

      await tester.pumpAndSettle();

      // At first we are on '/other' so only VWidget3 should be visible
      expect(vWidget1Finder, findsNothing);
      expect(vNesterFinder, findsOneWidget);
      expect(vWidget2Finder, findsNothing);
      expect(vWidget3Finder, findsOneWidget);

      // Pop to '/settings'
      // Tap the add button.
      vRouterKey.currentState!.systemPop();
      await tester.pumpAndSettle();

      // Now, only VWidget2 should be visible
      expect(vWidget1Finder, findsNothing);
      expect(vNesterFinder, findsOneWidget);
      expect(vWidget2Finder, findsOneWidget);
      expect(vWidget3Finder, findsNothing);
    });

    testWidgets('Pop on VNester from VNester.stackedRoutes',
        (tester) async {
      late final BuildContext context;

      await tester.pumpWidget(
        VRouter(
          initialUrl: '/lists/0',
          routes: [
            VNesterPage(
              path: '/lists',
              pageBuilder: (key, child, name) =>
                  MaterialPage(key: key, child: child, name: name),
              widgetBuilder: (child) => child,
              nestedRoutes: [
                VWidget(
                  path: null,
                  aliases: [r':_(.+)'],
                  widget: const Text('/lists'),
                  key: const ValueKey('lists'),
                ),
              ],
              stackedRoutes: [
                VPage(
                  path: '/lists/:listName',
                  pageBuilder: (_, child, ___) => MaterialPage(child: child),
                  widget: Builder(
                    builder: (ctx) {
                      context = ctx;
                      return const Text('/lists/:listName');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      );

      final vWidget1Finder = find.text('/lists');
      final vWidget2Finder = find.text('/lists/:listName');

      await tester.pumpAndSettle();

      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsOneWidget);

      // Pop with VNester stackedRoutes context
      Navigator.of(context).pop();

      await tester.pumpAndSettle();

      expect(vWidget1Finder, findsOneWidget);
      expect(vWidget2Finder, findsNothing);
    });

    testWidgets('BackButton appears if VNester can pop',
        (tester) async {
      await tester.pumpWidget(
        VRouter(
          routes: [
            VWidget(
              path: '/whatever',
              widget: const Text('whatever'),
              stackedRoutes: [
                VNester(
                  path: null,
                  widgetBuilder: (child) => Scaffold(
                    appBar: AppBar(
                      title: const Text('title'),
                    ),
                    body: child,
                  ),
                  nestedRoutes: [
                    VWidget(
                      path: '/',
                      widget: const Text('ok'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );

      final appBar = find.byType(BackButton);

      await tester.pumpAndSettle();
      expect(appBar, findsOneWidget);
    });

    testWidgets('BackButton does NOT appears if VNester can NOT pop',
        (tester) async {
      await tester.pumpWidget(
        VRouter(
          routes: [
            VNester(
              path: null,
              widgetBuilder: (child) => Scaffold(
                appBar: AppBar(
                  title: const Text('title'),
                ),
                body: child,
              ),
              nestedRoutes: [
                VWidget(
                  path: '/',
                  widget: const Text('ok'),
                ),
              ],
            ),
          ],
        ),
      );

      final backButton = find.byType(BackButton);

      await tester.pumpAndSettle();
      expect(backButton, findsNothing);
    });
  });

  testWidgets('Unused VNester child should not be an issue',
      (tester) async {
    final vRouterKey = GlobalKey<VRouterState>();

    await tester.pumpWidget(
      VRouter(
        key: vRouterKey,
        routes: [
          VWidget(path: '/settings', widget: const Text('Settings')),
          VNester(
            path: null,
            widgetBuilder: (child) => Scaffold(
              appBar: AppBar(
                title: const Text('title'),
              ),
              body: Container(), // We don't use the child
            ),
            nestedRoutes: [
              VWidget(
                path: '/',
                widget: const Text('Home'),
              ),
            ],
          ),
        ],
      ),
    );

    final appBar = find.byType(AppBar);
    final home = find.text('Home');
    final settings = find.text('Settings');

    await tester.pumpAndSettle();

    // We should be on VNester but the body (home)
    // should not be used
    expect(appBar, findsOneWidget);
    expect(home, findsNothing);
    expect(settings, findsNothing);

    // Navigate to '/settings', this should not be an issue
    vRouterKey.currentState!.to('/settings');
    await tester.pumpAndSettle();

    // We should now be on settings
    expect(appBar, findsNothing);
    expect(home, findsNothing);
    expect(settings, findsOneWidget);
  });
}
