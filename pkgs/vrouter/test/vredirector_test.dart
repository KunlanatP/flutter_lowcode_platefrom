import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vrouter/vrouter.dart';

main() {
  group('vRedirector in VRouter beforeLeave', () {
    testWidgets('vRedirector.stopRedirection', (tester) async {
      await tester.pumpWidget(
        VRouter(
          beforeLeave: (vRedirector, _) async => vRedirector.stopRedirection(),
          routes: [
            VWidget(
              path: '/',
              widget: Builder(
                builder: (context) => TextButton(
                  onPressed: () => VRouter.of(context).to('/settings'),
                  child: const Text('VWidget1'),
                ),
              ),
              stackedRoutes: [
                VWidget(
                  path: '/settings',
                  widget: const Text('VWidget2'),
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

      expect(vWidget1Finder, findsOneWidget);
      expect(vWidget2Finder, findsNothing);

      // Try navigating to 'settings'
      // Tap the add button.
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      // The navigation should have been stopped
      // so still only VWidget1 should be visible
      expect(vWidget1Finder, findsOneWidget);
      expect(vWidget2Finder, findsNothing);
    });

    testWidgets('vRedirector.to', (tester) async {
      await tester.pumpWidget(
        VRouter(
          beforeLeave: (vRedirector, _) async =>
              (vRedirector.toUrl != '/other') ? vRedirector.to('/other') : null,
          routes: [
            VWidget(
              path: '/',
              widget: Builder(
                builder: (context) => TextButton(
                  onPressed: () => VRouter.of(context).to('/settings'),
                  child: const Text('VWidget1'),
                ),
              ),
              stackedRoutes: [
                VWidget(
                  path: '/settings',
                  widget: const Text('VWidget2'),
                ),
                VWidget(
                  path: '/other',
                  widget: const Text('VWidget3'),
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

      expect(vWidget1Finder, findsOneWidget);
      expect(vWidget2Finder, findsNothing);
      expect(vWidget3Finder, findsNothing);

      // Try navigating to 'settings'
      // Tap the add button.
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      // The navigation should have been redirected to /other
      // So only VWidget3 should be visible
      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsNothing);
      expect(vWidget3Finder, findsOneWidget);
    });

    testWidgets('vRedirector.toSegments', (tester) async {
      await tester.pumpWidget(
        VRouter(
          beforeLeave: (vRedirector, _) async => (vRedirector.toUrl != '/other')
              ? vRedirector.toSegments(['other'])
              : null,
          routes: [
            VWidget(
              path: '/',
              widget: Builder(
                builder: (context) => TextButton(
                  onPressed: () => VRouter.of(context).to('/settings'),
                  child: const Text('VWidget1'),
                ),
              ),
              stackedRoutes: [
                VWidget(
                  path: '/settings',
                  widget: const Text('VWidget2'),
                ),
                VWidget(
                  path: '/other',
                  widget: const Text('VWidget3'),
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

      expect(vWidget1Finder, findsOneWidget);
      expect(vWidget2Finder, findsNothing);
      expect(vWidget3Finder, findsNothing);

      // Try navigating to 'settings'
      // Tap the add button.
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      // The navigation should have been redirected to /other
      // So only VWidget3 should be visible
      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsNothing);
      expect(vWidget3Finder, findsOneWidget);
    });

    testWidgets('vRedirector.pop', (tester) async {
      await tester.pumpWidget(
        VRouter(
          initialUrl: '/settings',
          beforeLeave: (vRedirector, _) async =>
              (vRedirector.toUrl != '/') ? vRedirector.pop() : null,
          routes: [
            VWidget(
              path: '/',
              widget: const Text('VWidget1'),
              stackedRoutes: [
                VWidget(
                  path: '/settings',
                  widget: Builder(
                    builder: (context) => TextButton(
                      onPressed: () => VRouter.of(context).to('/other'),
                      child: const Text('VWidget2'),
                    ),
                  ),
                ),
                VWidget(
                  path: '/other',
                  widget: const Text('VWidget3'),
                ),
              ],
            ),
          ],
        ),
      );

      await tester.pumpAndSettle();

      // At first we are on "/settings" (because we set initialUrl)
      // so only VWidget should be shown

      final vWidget1Finder = find.text('VWidget1');
      final vWidget2Finder = find.text('VWidget2');
      final vWidget3Finder = find.text('VWidget3');

      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsOneWidget);
      expect(vWidget3Finder, findsNothing);

      // Try navigating to '/other'
      // Tap the add button.
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      // The navigation should have been redirected to / because we popped instead
      // So only VWidget should be visible
      expect(vWidget1Finder, findsOneWidget);
      expect(vWidget2Finder, findsNothing);
      expect(vWidget3Finder, findsNothing);
    });

    testWidgets('vRedirector.systemPop', (tester) async {
      await tester.pumpWidget(
        VRouter(
          initialUrl: '/settings',
          beforeLeave: (vRedirector, _) async =>
              (vRedirector.toUrl != '/') ? vRedirector.systemPop() : null,
          routes: [
            VWidget(
              path: '/',
              widget: const Text('VWidget1'),
              stackedRoutes: [
                VWidget(
                  path: '/settings',
                  widget: Builder(
                    builder: (context) => TextButton(
                      onPressed: () => VRouter.of(context).to('/other'),
                      child: const Text('VWidget2'),
                    ),
                  ),
                ),
                VWidget(
                  path: '/other',
                  widget: const Text('VWidget3'),
                ),
              ],
            ),
          ],
        ),
      );

      await tester.pumpAndSettle();

      // At first we are on "/settings" (because we set initialUrl)
      // so only VWidget should be shown

      final vWidget1Finder = find.text('VWidget1');
      final vWidget2Finder = find.text('VWidget2');
      final vWidget3Finder = find.text('VWidget3');

      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsOneWidget);
      expect(vWidget3Finder, findsNothing);

      // Try navigating to '/other'
      // Tap the add button.
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      // The navigation should have been redirected to / because we popped instead
      // So only VWidget1 should be visible
      expect(vWidget1Finder, findsOneWidget);
      expect(vWidget2Finder, findsNothing);
      expect(vWidget3Finder, findsNothing);
    });

    testWidgets('vRedirector.toNamed', (tester) async {
      await tester.pumpWidget(
        VRouter(
          initialUrl: '/settings',
          beforeLeave: (vRedirector, _) async => (vRedirector.toUrl != '/other')
              ? vRedirector.toNamed('other')
              : null,
          routes: [
            VWidget(
              path: '/',
              widget: const Text('VWidget1'),
              stackedRoutes: [
                VWidget(
                  path: '/settings',
                  widget: Builder(
                    builder: (context) => TextButton(
                      onPressed: () => VRouter.of(context).to('/'),
                      child: const Text('VWidget2'),
                    ),
                  ),
                ),
                VWidget(
                    path: '/other', widget: const Text('VWidget3'), name: 'other'),
              ],
            ),
          ],
        ),
      );

      await tester.pumpAndSettle();

      // At first we are on "/settings" (because we set initialUrl)
      // so only VWidget should be shown

      final vWidget1Finder = find.text('VWidget1');
      final vWidget2Finder = find.text('VWidget2');
      final vWidget3Finder = find.text('VWidget3');

      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsOneWidget);
      expect(vWidget3Finder, findsNothing);

      // Try navigating to '/'
      // Tap the add button.
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      // The navigation should have been redirected to '/other'
      // So only VWidget should be visible
      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsNothing);
      expect(vWidget3Finder, findsOneWidget);
    });

    testWidgets('vRedirector.toNamed with path parameters',
        (tester) async {
      await tester.pumpWidget(
        VRouter(
          initialUrl: '/settings',
          beforeLeave: (vRedirector, _) async =>
              (vRedirector.newVRouterData?.names.contains('other') ?? false)
                  ? null
                  : vRedirector.toNamed('other', pathParameters: {'id': '2'}),
          routes: [
            VWidget(
              path: '/',
              widget: const Text('VWidget1'),
              stackedRoutes: [
                VWidget(
                  path: '/settings',
                  widget: Builder(
                    builder: (context) => TextButton(
                      onPressed: () => VRouter.of(context).to('/'),
                      child: const Text('VWidget2'),
                    ),
                  ),
                ),
                VWidget(
                    path: '/other/:id',
                    widget: const Text('VWidget3'),
                    name: 'other'),
              ],
            ),
          ],
        ),
      );

      await tester.pumpAndSettle();

      // At first we are on "/settings" (because we set initialUrl)
      // so only VWidget should be shown

      final vWidget1Finder = find.text('VWidget1');
      final vWidget2Finder = find.text('VWidget2');
      final vWidget3Finder = find.text('VWidget3');

      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsOneWidget);
      expect(vWidget3Finder, findsNothing);

      // Try navigating to '/'
      // Tap the add button.
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      // The navigation should have been redirected to '/other'
      // So only VWidget should be visible
      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsNothing);
      expect(vWidget3Finder, findsOneWidget);
    });
  });
}
