import 'package:dartz/dartz.dart';
import 'package:clean_advicer/domain/entities/advice_entity.dart';
import 'package:clean_advicer/domain/failures/failures.dart';
import 'package:clean_advicer/domain/repositories/advice_repo.dart';

class AdviceUseCases {
  final AdviceRepo adviceRepo;

  AdviceUseCases({required this.adviceRepo});

  Future<Either<Failures, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDatasource();
  }
}
