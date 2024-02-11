import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_german_test/2_application/pages/advice/bloc/advicer_bloc.dart';

void main() {
  group('AdvicerBloc', () {
    group('should emits', () {
      // * blocText<AdvicerBloc, AdvicerState>
      blocTest<AdvicerBloc, AdvicerState>('nothing when no event is added',
          build: () => AdvicerBloc(), expect: () => const <AdvicerState>[]);

      blocTest(
          '[AdvicerStateLoading, AdvicerStateError] when AdviceRequestedEvent is added',
          build: () => AdvicerBloc(),
          // * act
          act: (bloc) => bloc.add(AdviceRequestedEvent()),
          // * wait (no need?)
          wait: const Duration(seconds: 3),
          expect: () => const <AdvicerState>[]);
    });
  });
}
