import 'package:dice_calculator/shared/keys/ResultKeys.dart';
import 'package:dice_calculator/shared/services/RollDiceService.dart';

class CalculatorService {
  static final _operation = ["+", "-", "D"];

  static bool formulaIsValid(String formula) {
    // final result = _getSeparatorTerms(formula);
    // return result.result != "";
    return true;
  }

  static String calculate(String formula) {
    final term = _getSeparatorTerms(formula);
    return term.result;
  }

  static AbsTerm _getSeparatorTerms(String formula) {
    var term = NullTerm();
    formula = formula.replaceAll(" ", "");
    final parts = formula.split(";");
    if (parts.length == 0) return term;
    if (parts.length == 1) return _getExpressionTerms(formula, 0);
    final term1 = _getExpressionTerms(parts[0], 0);
    final remainderFormula = formula.replaceAll("${parts[0]};", "");
    final term2 = _getSeparatorTerms(remainderFormula);
    return SeparatorTerm(term1: term1, term2: term2);
  }

  static AbsTerm _getExpressionTerms(String formula, int index) {
    var term = NullTerm();
    if (index == _operation.length) {
      final value = int.tryParse(formula);
      return value == null ? term : ValueTerm(value: value);
    }
    final parts = formula.split(_operation[index]);
    if (parts.length == 0) return term;
    if (parts.length == 1) return _getExpressionTerms(formula, index + 1);
    final term1 = _getExpressionTerms(parts[0], index + 1);
    final remainderFormula =
        formula.replaceAll("${parts[0]}${_operation[index]}", "");
    final term2 = _getExpressionTerms(remainderFormula, 0);
    var type = OperationType.Sum;
    if (index == 1)
      type = OperationType.Subtraction;
    else if (index == 2) type = OperationType.Dice;
    return OperationTerm(type: type, term1: term1, term2: term2);
  }
}

abstract class AbsTerm {
  int value = 0;
  final rolledResults = <String>[];
  String get result => "";
}

class NullTerm extends AbsTerm {}

class ValueTerm extends AbsTerm {
  @override
  String get result => "${value}";

  ValueTerm({
    required int value,
  }) {
    super.value = value;
  }
}

enum OperationType {
  Sum,
  Subtraction,
  Dice,
}

class OperationTerm extends AbsTerm {
  @override
  String get result => _execute();

  final AbsTerm term1;
  final AbsTerm term2;
  final OperationType type;

  OperationTerm({
    required this.type,
    required this.term1,
    required this.term2,
  });

  _execute() {
    var operationResult = 0;
    if (term1.result == ResultKeys.invalid ||
        term2.result == ResultKeys.invalid) return ResultKeys.invalid;
    term1.rolledResults.forEach((element) => rolledResults.add(element));
    term2.rolledResults.forEach((element) => rolledResults.add(element));
    if (type == OperationType.Sum)
      operationResult = term1.value + term2.value;
    else if (type == OperationType.Subtraction)
      operationResult = term1.value - term2.value;
    else if (type == OperationType.Dice) {
      if (term2.value == 0) return ResultKeys.invalid;
      var quantity = term1.value;
      if (quantity == 0) quantity = 1;
      var rolledValues = [];
      for (int i = 0; i < quantity; i++) {
        final rolledValue = RollDiceService.rolldice(sides: term2.value);
        rolledValues.add(rolledValue);
        operationResult += rolledValue;
      }
      var rolledResult = "";
      rolledValues
          .forEach((element) => rolledResult = "${rolledResult}, ${element}");
      rolledResult =
          "${quantity}D${term2.value} = [${rolledResult.replaceFirst(", ", "")}]";
      rolledResults.add(rolledResult);
    }
    value = operationResult;
    var diceResults = "";
    rolledResults
        .forEach((element) => diceResults = "${diceResults}, ${element}");
    diceResults = "{${diceResults.replaceFirst(", ", "")}}";
    return "${diceResults} : ${value}";
  }
}

class SeparatorTerm extends AbsTerm {
  @override
  String get result =>
      term1.result == ResultKeys.invalid || term2.result == ResultKeys.invalid
          ? ResultKeys.invalid
          : "${term1.result};${term2.result}";

  final AbsTerm term1;
  final AbsTerm term2;

  SeparatorTerm({
    required this.term1,
    required this.term2,
  });
}
