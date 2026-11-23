import 'package:clean_advicer/domain/entities/advice_entity.dart';
import 'package:equatable/equatable.dart';

class AdviceModel extends AdviceEntity {
  AdviceModel({
    required String advice,
    required int id,
  }) : super(advice: advice, id: id);

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(
      advice: json['slip']['advice'],
      id: json['slip']['id'],
    );
  }
}