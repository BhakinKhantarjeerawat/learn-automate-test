import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_german_test/1_domain/entities/advice_entities.dart';
import 'package:learn_german_test/1_domain/failures/failures.dart';
import 'package:learn_german_test/1_domain/usecases/advice_usecases.dart';
import 'package:mockito/annotations.dart';
import 'package:learn_german_test/0_data/repositories/advice_repo_iml.dart';
import 'package:mockito/mockito.dart';
// * beware of using mocktail
// import 'package:mocktail/mocktail.dart';

@GenerateNiceMocks([MockSpec<AdviceRepoImpl>()])
import 'advice_usecases_test.mocks.dart';

void main() {
  group('AdviceUseCases', () {
    group('should return AdviceEntity', () {
      test('when AdviceRepoImpl returns a AdviceModel', () async {
        final mockAdviceRepoImpl = MockAdviceRepoImpl();
        final adviceUseCaseUnderTest =
            AdviceUseCases(adviceRepo: mockAdviceRepoImpl);
        when(mockAdviceRepoImpl.getAdviceFromDatasource()).thenAnswer(
            (invocation) => Future.value(
                const Right(AdviceEntity(advice: 'test', id: 42))));
        final result = await adviceUseCaseUnderTest.getAdvice();
        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(
            result,
            const Right<Failure, AdviceEntity>(
                AdviceEntity(advice: 'test', id: 42)));
        verify(mockAdviceRepoImpl.getAdviceFromDatasource()).called(1);
      verifyNoMoreInteractions(mockAdviceRepoImpl);
    });
  });
});
}