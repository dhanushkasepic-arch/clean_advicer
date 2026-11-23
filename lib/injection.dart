import 'package:clean_advicer/application/pages/advice/bloc/advicer_bloc.dart';
import 'package:clean_advicer/data/datasources/advice_remote_datasource.dart';
import 'package:clean_advicer/data/repositories/advice_repo_impl.dart';
import 'package:clean_advicer/domain/repositories/advice_repo.dart';
import 'package:clean_advicer/domain/use_cases/advice_use_cases.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance; // sl == Service Locator

Future<void> init() async {
  // ! Application layer
  sl.registerFactory(
    () => AdvicerBloc(adviceUseCases: sl()),
  );

  // ! Domain Layer
  sl.registerFactory(
    () => AdviceUseCases(adviceRepo: sl()),
  );

  // ! Data Layer
  sl.registerFactory<AdviceRepo>(
    () => AdviceRepoImpl(remoteDatasource: sl()),
  );

  sl.registerFactory<AdviceRemoteDatasource>(
    () => AdviceRemoteDatasourceImpl(client: sl()),
  );

  // ! externs
  sl.registerFactory(() => http.Client());
}
