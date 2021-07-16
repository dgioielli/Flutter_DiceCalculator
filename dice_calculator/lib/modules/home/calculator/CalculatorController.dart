import 'package:dice_calculator/shared/keys/KeyboardKeys.dart';
import 'package:dice_calculator/shared/keys/ResultKeys.dart';
import 'package:dice_calculator/shared/models/HistoryModel.dart';
import 'package:dice_calculator/shared/repositories/HistoryRepository.dart';
import 'package:dice_calculator/shared/services/CalculatorService.dart';
import 'package:flutter/cupertino.dart';

class CalculatorController {
  static final CalculatorController _singleton =
      CalculatorController._internal();

  factory CalculatorController() {
    return _singleton;
  }

  CalculatorController._internal() {}

  final formulaInputNotfier = ValueNotifier<String>("");
  String get formulaInput => formulaInputNotfier.value;
  set formulaInput(String value) => formulaInputNotfier.value = value;

  final resultInputNotifier = ValueNotifier<String>("");
  String get resultInput => resultInputNotifier.value;
  set resultInput(String value) => resultInputNotifier.value = value;

  final historyRepository = HistoryRepository();

  void onPressedKey({required String key}) {
    if (key == KeyboardKeys.backspaceKey) {
      if (formulaInput.isEmpty) return;
      formulaInput = formulaInput.substring(0, formulaInput.length - 1);
      return;
    }
    if (key == KeyboardKeys.cleanKey) {
      formulaInput = "";
      resultInput = "";
      return;
    }
    formulaInput = "${formulaInput}${key}";
  }

  void rollFormula() {
    if (!CalculatorService.formulaIsValid(formulaInput)) {
      resultInput = ResultKeys.invalid;
      return;
    }
    resultInput = CalculatorService.calculate(formulaInput);
    historyRepository.addCalculatorList(
      HistoryModel(key: formulaInput, value: resultInput),
    );
  }
}
