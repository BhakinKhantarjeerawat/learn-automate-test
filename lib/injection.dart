
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:learn_german_test/0_data/data_sources.dart/advice_remote_data_source.dart';
import 'package:learn_german_test/0_data/repositories/advice_repo_iml.dart';
import 'package:learn_german_test/1_domain/repositories/advice_repo.dart';
import 'package:learn_german_test/1_domain/usecases/advice_usecases.dart';
import 'package:learn_german_test/2_application/pages/advice/cubit/advicer_cubit.dart';

final sl = GetIt.I; // sl == Service Locator

Future<void> init() async {
// ! application Layer
  // Factory = every time a new/fresh instance of that class
  sl.registerFactory(() => AdvicerCubit(adviceUseCases: sl()));

// ! domain Layer
  sl.registerFactory(() => AdviceUseCases(adviceRepo: sl()));

// ! data Layer
  sl.registerFactory<AdviceRepo>(
      () => AdviceRepoImpl(adviceRemoteDatasource: sl()));
  sl.registerFactory<AdviceRemoteDatasource>(
      () => AdviceRemoteDatasourceImpl(client: sl()));

// ! externs
  sl.registerFactory(() => http.Client());
}