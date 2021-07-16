import 'package:dice_calculator/shared/models/HistoryModel.dart';
import 'package:dice_calculator/shared/repositories/HistoryRepository.dart';
import 'package:dice_calculator/shared/services/RollDiceService.dart';
import 'package:flutter/cupertino.dart';

class DiceRollerController {
  static final DiceRollerController _singleton =
      DiceRollerController._internal();

  factory DiceRollerController() {
    return _singleton;
  }

  DiceRollerController._internal() {}

  final resultNotifier = ValueNotifier<String>("-------");
  String get result => resultNotifier.value;
  set result(String value) => resultNotifier.value = value;
  final historyRepository = HistoryRepository();
  int _value = 0;
  int _dice = 0;
  bool showHistiry = false;

  void rollDice({required int sides}) {
    _dice = sides;
    _value = RollDiceService.rolldice(sides: _dice);
    result = _value <= 0 ? "-------" : "D${_dice} = ${_value}";
    historyRepository.addRollerItem(HistoryModel(
      key: "D${_dice} = ${_value}",
      value: "[${_value}]",
    ));
  }
}
