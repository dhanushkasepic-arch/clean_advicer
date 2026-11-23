import 'package:dartz/dartz.dart';
import 'package:clean_advicer/domain/entities/advice_entity.dart';
import 'package:clean_advicer/domain/failures/failures.dart';

abstract class AdviceRepo {
  Future<Either<Failures, AdviceEntity>> getAdviceFromDatasource();
}
