import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vrouter/vrouter.dart';

main() {
  group(
      'Names test\n'
      'Test whether getting the names of every VRouteElements of the current routeStack works.',
      () {
    testWidgets('names from key', (tester) async {
      final vRouterKey = GlobalKey<VRouterState>();

      await tester.pumpWidget(
        VRouter(
          key: vRouterKey,
          routes: [
            VWidget(
              path: '/',
              name: 'home',
              widget: const Text('VWidget1'),
            ),
          ],
        ),
      );

      await tester.pumpAndSettle();

      // At first we are on "/" so "home" should be the only name
      expect(vRouterKey.currentState!.names, ['home']);
    });

    testWidgets("names from context", (tester) async {
      final vRouterKey = GlobalKey<VRouterState>();

      late final List<String> names;

      await tester.pumpWidget(
        VRouter(
          key: vRouterKey,
          routes: [
            VWidget(
              path: '/',
              name: 'home',
              widget: Builder(
                builder: (context) {
                  names = context.vRouter.names;
                  return const Text('VWidget1');
                },
              ),
            ),
          ],
        ),
      );

      await tester.pumpAndSettle();

      // At first we are on "/" so "home" should be the only name
      expect(names, ['home']);
    });

    testWidgets("names in stackedRoutes", (tester) async {
      final vRouterKey = GlobalKey<VRouterState>();

      late final List<String> namesFromSettings;
      late final List<String> namesFromHome;

      await tester.pumpWidget(
        VRouter(
          key: vRouterKey,
          routes: [
            VWidget(
              path: '/settings',
              name: 'settings',
              widget: Builder(
                builder: (context) {
                  namesFromSettings = context.vRouter.names;
                  return const Text('VWidget2');
                },
              ),
              stackedRoutes: [
                VWidget(
                  path: '/',
                  name: 'home',
                  widget: Builder(
                    builder: (context) {
                      namesFromHome = context.vRouter.names;
                      return const Text('VWidget1');
                    },
                  ),
                ),
                VWidget(path: '/other', name: 'other', widget: const Text('Other'))
              ],
            ),
          ],
        ),
      );

      await tester.pumpAndSettle();

      // At first we are on "/" so "home" should be the only name
      expect(namesFromHome, ['home', 'settings']);
      expect(namesFromSettings, ['home', 'settings']);
    });

    testWidgets("names in nestedRoutes", (tester) async {
      final vRouterKey = GlobalKey<VRouterState>();

      late final List<String> namesFromNester;
      late final List<String> namesFromHome;

      await tester.pumpWidget(
        VRouter(
          key: vRouterKey,
          routes: [
            VNester(
              path: '/settings',
              name: 'nester',
              widgetBuilder: (child) => Builder(
                builder: (context) {
                  namesFromNester = context.vRouter.names;
                  return child;
                },
              ),
              nestedRoutes: [
                VWidget(
                  path: '/',
                  name: 'home',
                  widget: Builder(
                    builder: (context) {
                      namesFromHome = context.vRouter.names;
                      return const Text('VWidget1');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      );

      await tester.pumpAndSettle();

      // At first we are on "/" so "home" should be the only name
      expect(namesFromHome, ['home', 'nester']);
      expect(namesFromNester, ['home', 'nester']);
    });
  });
}
