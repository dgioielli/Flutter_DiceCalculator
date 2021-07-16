import 'package:dice_calculator/shared/services/RollDiceService.dart';

class CalculatorService {
  static final _operation = ["+", "-", "D"];

  static bool formulaIsValid(String formula) {
    final result = _getSeparatorTerms(formula);
    return result.result != "";
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
  String get result => "";
}

class NullTerm implements AbsTerm {
  int value = 0;
  String get result => "";
}

class ValueTerm implements AbsTerm {
  int value;
  @override
  String get result => "${value}";

  ValueTerm({
    required this.value,
  });
}

enum OperationType {
  Sum,
  Subtraction,
  Dice,
}

class OperationTerm implements AbsTerm {
  @override
  int value = 0;
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
    if (type == OperationType.Sum)
      operationResult = term1.value + term2.value;
    else if (type == OperationType.Subtraction)
      operationResult = term1.value - term2.value;
    else if (type == OperationType.Dice) {
      var rolledValues = [];
      for (int i = 0; i < term1.value; i++) {
        final rolledValue = RollDiceService.rolldice(sides: term2.value);
        rolledValues.add(rolledValue);
        operationResult += rolledValue;
      }
    }
    value = operationResult;
    return "${value}";
  }
}

class SeparatorTerm implements AbsTerm {
  @override
  int value = 0;
  @override
  String get result => "${term1.result};${term2.result}";

  final AbsTerm term1;
  final AbsTerm term2;

  SeparatorTerm({
    required this.term1,
    required this.term2,
  });
}
