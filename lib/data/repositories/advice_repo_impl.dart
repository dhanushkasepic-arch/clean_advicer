import 'package:dartz/dartz.dart';
import 'package:clean_advicer/domain/entities/advice_entity.dart';
import 'package:clean_advicer/domain/failures/failures.dart';
import 'package:clean_advicer/domain/repositories/advice_repo.dart';

import '../../data/datasources/advice_remote_datasource.dart';
import '../exceptions/exceptions.dart';

class AdviceRepoImpl implements AdviceRepo {


  final AdviceRemoteDatasource remoteDatasource;

  AdviceRepoImpl({required this.remoteDatasource});

  @override
  Future<Either<Failures, AdviceEntity>> getAdviceFromDatasource() async {

    try {
      final advice = await remoteDatasource.getRandomAdviceFromApi();

      return Right(advice);
    }on ServerException catch (_){
      return Left(ServerFailure());
    } catch (e) {
      return Left(GeneralFailure());
    }
  }
}