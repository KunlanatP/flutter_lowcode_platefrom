import 'package:flutter_test/flutter_test.dart';

import 'package:oneweb_widgets/oneweb_widgets.dart';

void main() {
  testWidgets(
    "render empty widget",
    (WidgetTester tester) async {
      await tester.pumpWidget(const EmptyWidget());
      expect(find.byType(EmptyWidget), findsOneWidget);
    },
  );
}
