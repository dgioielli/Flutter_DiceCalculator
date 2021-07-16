import 'package:dice_calculator/shared/repositories/DiceStatisticsRepository.dart';
import 'package:flutter/cupertino.dart';

class ChartsController {
  static final ChartsController _singleton = ChartsController._internal();

  factory ChartsController() {
    return _singleton;
  }

  ChartsController._internal() {}

  final nameDiceNotifier = ValueNotifier<String>("D100");
  String get nameDice => nameDiceNotifier.value;
  set nameDice(String value) => nameDiceNotifier.value = value;

  var diceNames = ['D100', 'D20', 'D12', 'D10', 'D8', "D6", "D4", "D3", "D2"];

  String getDiceData() {
    final dice = DiceStatisticsRepository().getDice(nameDice);
    return "Total: ${dice.totalSamples().toStringAsFixed(0)}; Mean = ${dice.average().toStringAsFixed(1)} +-(${dice.variation().toStringAsPrecision(1)})";
  }
}
