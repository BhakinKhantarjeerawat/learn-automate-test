import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_german_test/2_application/pages/advice/widgets/custom_button.dart';
import 'package:mocktail/mocktail.dart';

// * abstract class OnCustomButttonTap {
// void call();
// }

abstract class OnCustomButtonTap {
  void call();
}

class MockOnCustomButtonTap extends Mock implements OnCustomButtonTap {}

void main() {
  Widget widgetUnderMethod({Function()? callback}) {
    return MaterialApp(
        home: Scaffold(
      body: CustomButton(
        onTap: callback,
      ),
    ));
  }

  group('CustomButton', () {
    group('is Button rendered correctly', () {
      testWidgets('and has all parts needed', (tester) async {
        await tester.pumpWidget(widgetUnderMethod());

        // final buttonLabelFinder = find.text('Get Advice');
        expect(find.text('Get Advice'), findsOneWidget);
      });
    });

    group('should handle onTap', () {
      testWidgets('when someone has pressed the button', (tester) async {
        final mockOnCustomButtonTap = MockOnCustomButtonTap();
        await tester
            .pumpWidget(widgetUnderMethod(callback: mockOnCustomButtonTap));
        await tester.tap(find.byType(CustomButton));
        verify(mockOnCustomButtonTap).called(1);
      });
    });
  });
}
