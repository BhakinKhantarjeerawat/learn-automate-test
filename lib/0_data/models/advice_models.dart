import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:learn_german_test/1_domain/entities/advice_entities.dart';

@immutable
class AdviceModel extends AdviceEntity implements EquatableMixin {
 const AdviceModel({required String advice, required int id})
      : super(advice: advice, id: id);

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(advice: json['advice'], id: json['advice_id']);
  }
}