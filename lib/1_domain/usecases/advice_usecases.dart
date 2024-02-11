import 'package:dartz/dartz.dart';
import 'package:learn_german_test/1_domain/entities/advice_entities.dart';
import 'package:learn_german_test/1_domain/failures/failures.dart';
import 'package:learn_german_test/1_domain/repositories/advice_repo.dart';

class AdviceUseCases {
  AdviceUseCases({required this.adviceRepo});
  final AdviceRepo adviceRepo;

  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDatasource();
    // space for business logic
  }
}