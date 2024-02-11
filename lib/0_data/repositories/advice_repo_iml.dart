import 'package:dartz/dartz.dart';
import 'package:learn_german_test/0_data/data_sources.dart/advice_remote_data_source.dart';
import 'package:learn_german_test/0_data/exceptions/exceptions.dart';
import 'package:learn_german_test/1_domain/entities/advice_entities.dart';
import 'package:learn_german_test/1_domain/failures/failures.dart';
import 'package:learn_german_test/1_domain/repositories/advice_repo.dart';

class AdviceRepoImpl implements AdviceRepo {
  AdviceRepoImpl({required this.adviceRemoteDatasource});
  final AdviceRemoteDatasource adviceRemoteDatasource;
  
  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource() async {
    try {
      final result = await adviceRemoteDatasource.getRandomAdviceFromApi();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}