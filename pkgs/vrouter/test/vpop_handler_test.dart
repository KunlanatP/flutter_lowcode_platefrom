import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vrouter/vrouter.dart';

main() {
  group('VPopHandler', () {
    testWidgets('VPopHandler onPop', (tester) async {
      final vRouterKey = GlobalKey<VRouterState>();

      await tester.pumpWidget(
        VRouter(
          key: vRouterKey,
          routes: [
            VWidget(
              path: '/settings',
              widget: const Text('VWidget1'),
              stackedRoutes: [
                VPopHandler(
                  onPop: (vRedirector) async => vRedirector.stopRedirection(),
                  stackedRoutes: [
                    VWidget(
                      path: '/',
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

      // At first we are on "/" so only VWidget2 should be shown

      final vWidget1Finder = find.text('VWidget1');
      final vWidget2Finder = find.text('VWidget2');

      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsOneWidget);

      // Try to pop
      // Tap the add button.
      vRouterKey.currentState!.pop();
      await tester.pumpAndSettle();

      // pop should have been prevented, to VWidget2 should still be visible
      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsOneWidget);
    });

    testWidgets('VPopHandler onSystemPop', (tester) async {
      final vRouterKey = GlobalKey<VRouterState>();

      await tester.pumpWidget(
        VRouter(
          key: vRouterKey,
          routes: [
            VWidget(
              path: '/settings',
              widget: const Text('VWidget1'),
              stackedRoutes: [
                VPopHandler(
                  onSystemPop: (vRedirector) async =>
                      vRedirector.stopRedirection(),
                  stackedRoutes: [
                    VWidget(
                      path: '/',
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

      // At first we are on "/" so only VWidget2 should be shown

      final vWidget1Finder = find.text('VWidget1');
      final vWidget2Finder = find.text('VWidget2');

      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsOneWidget);

      // Try to pop
      // Tap the add button.
      await vRouterKey.currentState!.systemPop();
      await tester.pumpAndSettle();

      // pop should have been prevented, to VWidget2 should still be visible
      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsOneWidget);
    });
    testWidgets('VPopHandler onPop not called if VRouteElement is not popped',
        (tester) async {
      final vRouterKey = GlobalKey<VRouterState>();

      await tester.pumpWidget(
        VRouter(
          key: vRouterKey,
          routes: [
            VPopHandler(
              onPop: (vRedirector) async => vRedirector.stopRedirection(),
              stackedRoutes: [
                VWidget(
                  path: '/settings',
                  widget: const Text('VWidget1'),
                  stackedRoutes: [
                    VWidget(
                      path: '/',
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

      // At first we are on "/" so only VWidget2 should be shown

      final vWidget1Finder = find.text('VWidget1');
      final vWidget2Finder = find.text('VWidget2');

      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsOneWidget);

      // Try to pop
      // Tap the add button.
      await vRouterKey.currentState!.pop();
      await tester.pumpAndSettle();

      // pop should have been prevented, to VWidget2 should still be visible
      expect(vWidget1Finder, findsOneWidget);
      expect(vWidget2Finder, findsNothing);
    });

    testWidgets(
        'VPopHandler onSystemPop not called if VRouteElement is not popped',
        (tester) async {
      final vRouterKey = GlobalKey<VRouterState>();

      await tester.pumpWidget(
        VRouter(
          key: vRouterKey,
          routes: [
            VPopHandler(
              onSystemPop: (vRedirector) async => vRedirector.stopRedirection(),
              stackedRoutes: [
                VWidget(
                  path: '/settings',
                  widget: const Text('VWidget1'),
                  stackedRoutes: [
                    VWidget(
                      path: '/',
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

      // At first we are on "/" so only VWidget2 should be shown

      final vWidget1Finder = find.text('VWidget1');
      final vWidget2Finder = find.text('VWidget2');

      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsOneWidget);

      // Try to pop
      // Tap the add button.
      await vRouterKey.currentState!.systemPop();
      await tester.pumpAndSettle();

      // pop should have been prevented, to VWidget2 should still be visible
      expect(vWidget1Finder, findsOneWidget);
      expect(vWidget2Finder, findsNothing);
    });

    testWidgets('VPopHandler deeply nested onPop', (tester) async {
      final vRouterKey = GlobalKey<VRouterState>();

      await tester.pumpWidget(
        VRouter(
          key: vRouterKey,
          routes: [
            VWidget(
              path: '/other',
              widget: const Text('VWidget1'),
              stackedRoutes: [
                VNester(
                  path: '/settings',
                  widgetBuilder: (child) => child,
                  nestedRoutes: [
                    VPopHandler(
                      onPop: (vRedirector) async =>
                          vRedirector.stopRedirection(),
                      stackedRoutes: [
                        VWidget(
                          path: '/',
                          widget: const Text('VWidget2'),
                        ),
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

      // At first we are on "/" so only VWidget2 should be shown

      final vWidget1Finder = find.text('VWidget1');
      final vWidget2Finder = find.text('VWidget2');

      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsOneWidget);

      // Try to pop
      // This should try to pop VNester but VPopHandler is nested inside a popping VRouteElement
      // therefore should also be popped
      await vRouterKey.currentState!.pop();
      await tester.pumpAndSettle();

      // pop should have been prevented, to VWidget2 should still be visible
      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsOneWidget);
    });

    testWidgets('VPopHandler deeply nested onSystemPop',
        (tester) async {
      final vRouterKey = GlobalKey<VRouterState>();

      await tester.pumpWidget(
        VRouter(
          key: vRouterKey,
          routes: [
            VWidget(
              path: '/other',
              widget: const Text('VWidget1'),
              stackedRoutes: [
                VNester(
                  path: '/settings',
                  widgetBuilder: (child) => child,
                  nestedRoutes: [
                    VPopHandler(
                      onSystemPop: (vRedirector) async =>
                          vRedirector.stopRedirection(),
                      stackedRoutes: [
                        VWidget(
                          path: '/',
                          widget: const Text('VWidget2'),
                        ),
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

      // At first we are on "/" so only VWidget2 should be shown

      final vWidget1Finder = find.text('VWidget1');
      final vWidget2Finder = find.text('VWidget2');

      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsOneWidget);

      // Try to pop
      // This should try to pop VNester but VPopHandler is nested inside a popping VRouteElement
      // therefore should also be popped
      await vRouterKey.currentState!.systemPop();
      await tester.pumpAndSettle();

      // pop should have been prevented, to VWidget2 should still be visible
      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsOneWidget);
    });
  });

  testWidgets('VPopHandler pop on error stopped', (tester) async {
    final vRouterKey = GlobalKey<VRouterState>();

    await tester.pumpWidget(
      VRouter(
        key: vRouterKey,
        routes: [
          VWidget(
            path: '/:id', // Popping here with no pathParams will yield an error
            widget: const Text('VWidget1'),
            stackedRoutes: [
              VPopHandler(
                onPop: (vRedirector) async => vRedirector.stopRedirection(),
                stackedRoutes: [
                  VWidget(
                    path: '/',
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

    // At first we are on "/" so only VWidget2 should be shown

    final vWidget1Finder = find.text('VWidget1');
    final vWidget2Finder = find.text('VWidget2');

    expect(vWidget1Finder, findsNothing);
    expect(vWidget2Finder, findsOneWidget);

    // Try to pop
    // Tap the add button.
    await vRouterKey.currentState!.pop();
    await tester.pumpAndSettle();

    // pop should have been prevented, to VWidget2 should still be visible
    expect(vWidget1Finder, findsNothing);
    expect(vWidget2Finder, findsOneWidget);
  });
}
