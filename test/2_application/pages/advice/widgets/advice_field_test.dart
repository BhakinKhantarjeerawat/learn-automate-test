import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_german_test/2_application/pages/advice/widgets/advice_field.dart';

void main() {
  Widget widgetUnderTest({required String adviceText}) {
    return MaterialApp(
      home: AdviceField(advice: adviceText),
    );
  }

  group('AdviceField', () {
    group('should be displayed correctly', () {
      testWidgets('when a short text is given', (tester) async {
        const text = 'a';

        await tester.pumpWidget(widgetUnderTest(adviceText: text));
        await tester.pumpAndSettle();

        // final adviceFieldFinder = find.textContaining('a');
        expect(find.textContaining('a'), findsOneWidget);
      });
    });
  });
}
