import 'package:dartz/dartz.dart';
import 'package:learn_german_test/1_domain/entities/advice_entities.dart';

import '../failures/failures.dart';


// * only abstract class?
abstract class AdviceRepo {
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource();
}