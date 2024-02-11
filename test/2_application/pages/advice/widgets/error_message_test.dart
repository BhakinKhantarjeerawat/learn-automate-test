import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_german_test/2_application/pages/advice/widgets/error_message.dart';

void main() {
  Widget widgetUnderTest({required String message}) {
    return MaterialApp(
      home: ErrorMessage(message: message),
    );
  }

  group('Error message', () {
    group('should be displayed correctly', () {
      testWidgets('when a short text is given', (tester) async {
        await tester.pumpWidget(widgetUnderTest(message: 'a'));
        await tester.pumpAndSettle();
        expect(find.byType(ErrorMessage), findsOneWidget);
      });
    });
  });
}
