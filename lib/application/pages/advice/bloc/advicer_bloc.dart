import 'package:clean_advicer/domain/failures/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_advicer/domain/use_cases/advice_use_cases.dart';
import 'package:clean_advicer/domain/entities/advice_entity.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

const generalFailureMessage = 'Ups, something went wrong. Please try again!';
const serverFailureMessage = 'Ups, Server Error. Please try again!';
const cacheFailureMessage = 'Ups, cache failure. Please try again!';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  String _mapFailureToMessage(Failures failure) {
    if (failure is ServerFailure) {
      return serverFailureMessage;
    } else if (failure is CacheFailure) {
      return cacheFailureMessage;
    } else {
      return generalFailureMessage;
    }
  }

  AdvicerBloc({required AdviceUseCases adviceUseCases})
    : super(AdvicerInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdvicerStateLoading());

      final failureOrAdvice = await adviceUseCases.getAdvice();

      failureOrAdvice.fold(
        (failure) =>
            emit(AdvicerStateError(message: _mapFailureToMessage(failure))),

        (advice) => emit(AdvicerStateLoaded(advice: advice)),
      );
    });
  }
}
