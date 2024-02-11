import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_german_test/1_domain/entities/advice_entities.dart';
import 'package:learn_german_test/1_domain/failures/failures.dart';
import 'package:learn_german_test/1_domain/usecases/advice_usecases.dart';
import 'package:learn_german_test/2_application/pages/advice/cubit/advicer_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockAdviceUseCases extends Mock implements AdviceUseCases {}

void main() {
  group('AdvicerCubit', () {
    group('should emit', () {
      MockAdviceUseCases mockAdviceUseCases = MockAdviceUseCases();

      blocTest('nothing when no method is called',
          build: () => AdvicerCubit(adviceUseCases: mockAdviceUseCases),
          expect: () => const <AdvicerCubitState>[]);

      blocTest(
          '[AdviceStateLoading, AdviceStateLoaded] when adviceRequested() is called',
          setUp: () => when(() => mockAdviceUseCases.getAdvice()).thenAnswer(
              (invocation) => Future.value(const Right<Failure, AdviceEntity>(
                  AdviceEntity(advice: 'advice', id: 1)))),
          build: () => AdvicerCubit(adviceUseCases: mockAdviceUseCases),
          act: (cubit) => cubit.adviceRequested(),
          expect: () => const <AdvicerCubitState>[
                AdvicerStateLoading(),
                AdvicerStateLoaded(advice: 'advice')
              ]);

      group(
          '[AdviceStateLoading, AdviceStateError] when adviceRequested() is called',
          () {
        blocTest('and a server failure occers',
            setUp: () => when(() => mockAdviceUseCases.getAdvice()).thenAnswer(
                (invocation) =>
                    Future.value(Left<Failure, AdviceEntity>(ServerFailure()))),
            build: () => AdvicerCubit(adviceUseCases: mockAdviceUseCases),
            act: (cubit) => cubit.adviceRequested(),
            expect: () => const <AdvicerCubitState>[
                  AdvicerStateLoading(),
                  AdvicerStateError(message: serverFailureMessage)
                ]);

        blocTest('and a cache failure occers',
            setUp: () => when(() => mockAdviceUseCases.getAdvice()).thenAnswer(
                (invocation) =>
                    Future.value(Left<Failure, AdviceEntity>(CacheFailure()))),
            build: () => AdvicerCubit(adviceUseCases: mockAdviceUseCases),
            act: (cubit) => cubit.adviceRequested(),
            expect: () => const <AdvicerCubitState>[
                  AdvicerStateLoading(),
                  AdvicerStateError(message: cacheFailureMessage)
                ]);
      });

      blocTest('and a general failure occers',
          setUp: () => when(() => mockAdviceUseCases.getAdvice()).thenAnswer(
              (invocation) =>
                  Future.value(Left<Failure, AdviceEntity>(CacheFailure()))),
          build: () => AdvicerCubit(adviceUseCases: mockAdviceUseCases),
          act: (cubit) => cubit.adviceRequested(),
          expect: () => const <AdvicerCubitState>[
                AdvicerStateLoading(),
                AdvicerStateError(message: cacheFailureMessage)
              ]);
    });
  });
  testWidgets('advicer cubit ...', (tester) async {
    // TODO: Implement test
  });
}
