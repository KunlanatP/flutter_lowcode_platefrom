import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vrouter/vrouter.dart';

main() {
  group('LocalVRouterData', () {
    testWidgets('LocalVRouterData to', (tester) async {
      await tester.pumpWidget(
        VRouter(
          routes: [
            VWidget(
              path: '/',
              widget: Builder(
                builder: (context) => TextButton(
                  child: const Text('VWidget1'),
                  onPressed: () => VRouter.of(context).to('/settings'),
                ),
              ),
              stackedRoutes: [
                VWidget(
                  path: '/settings',
                  widget: Builder(
                    builder: (context) => TextButton(
                      child: const Text('VWidget2'),
                      onPressed: () => VRouter.of(context).to('/'),
                    ),
                  ),
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

      // Navigate to 'settings'
      // Tap the add button.
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      // Now, only VWidget2 should be visible
      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsOneWidget);
    });

    testWidgets('LocalVRouterData toSegments', (tester) async {
      await tester.pumpWidget(
        VRouter(
          routes: [
            VWidget(
              path: '/',
              widget: Builder(
                builder: (context) => TextButton(
                  child: const Text('VWidget1'),
                  onPressed: () => VRouter.of(context).toSegments(['settings']),
                ),
              ),
              stackedRoutes: [
                VWidget(
                  path: '/settings',
                  widget: Builder(
                    builder: (context) => TextButton(
                      child: const Text('VWidget2'),
                      onPressed: () => VRouter.of(context).toSegments([]),
                    ),
                  ),
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

      // Navigate to 'settings'
      // Tap the add button.
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      // Now, only VWidget2 should be visible
      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsOneWidget);
    });

    testWidgets('LocalVRouterData pop', (tester) async {
      await tester.pumpWidget(
        VRouter(
          routes: [
            VWidget(
              path: '/settings',
              widget: const Text('VWidget1'),
              stackedRoutes: [
                VWidget(
                  path: '/',
                  widget: Builder(
                    builder: (context) => TextButton(
                      child: const Text('VWidget2'),
                      onPressed: () => VRouter.of(context).pop(),
                    ),
                  ),
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

      // Navigate to 'settings'
      // Tap the add button.
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      // Now, only VWidget2 should be visible
      expect(vWidget1Finder, findsOneWidget);
      expect(vWidget2Finder, findsNothing);
    });

    testWidgets('LocalVRouterData systemPop', (tester) async {
      await tester.pumpWidget(
        VRouter(
          routes: [
            VWidget(
              path: '/settings',
              widget: const Text('VWidget1'),
              stackedRoutes: [
                VWidget(
                  path: '/',
                  widget: Builder(
                    builder: (context) => TextButton(
                      child: const Text('VWidget2'),
                      onPressed: () => VRouter.of(context).systemPop(),
                    ),
                  ),
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

      // Navigate to 'settings'
      // Tap the add button.
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      // Now, only VWidget2 should be visible
      expect(vWidget1Finder, findsOneWidget);
      expect(vWidget2Finder, findsNothing);
    });

    testWidgets('LocalVRouterData toNamed', (tester) async {
      await tester.pumpWidget(
        VRouter(
          routes: [
            VWidget(
              path: '/',
              widget: Builder(
                builder: (context) => TextButton(
                  child: const Text('VWidget1'),
                  onPressed: () => VRouter.of(context).toNamed('settings'),
                ),
              ),
              stackedRoutes: [
                VWidget(
                    path: '/settings',
                    widget: const Text('VWidget2'),
                    name: 'settings'),
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

      // Navigate to 'settings'
      // Tap the add button.
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      // Now, only VWidget2 should be visible
      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsOneWidget);
    });

    testWidgets('LocalVRouterData toNamed with path parameters',
        (tester) async {
      await tester.pumpWidget(
        VRouter(
          routes: [
            VWidget(
              path: '/',
              widget: Builder(
                builder: (context) => TextButton(
                  child: const Text('VWidget1'),
                  onPressed: () => VRouter.of(context)
                      .toNamed('settings', pathParameters: {'id': '2'}),
                ),
              ),
              stackedRoutes: [
                VWidget(
                  path: '/:id',
                  widget: const Text('VWidget2'),
                  name: 'settings',
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

      // Navigate to 'settings'
      // Tap the add button.
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      // Now, only VWidget2 should be visible
      expect(vWidget1Finder, findsNothing);
      expect(vWidget2Finder, findsOneWidget);
    });
  });
}
