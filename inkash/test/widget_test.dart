import 'package:flutter_test/flutter_test.dart';

import 'package:inkash/app.dart';

void main() {
  testWidgets('Inkash smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const InkashApp());

    expect(find.text('Hola, Kevin'), findsOneWidget);
    expect(find.text('TE QUEDAN DISPONIBLES'), findsOneWidget);
  });
}
