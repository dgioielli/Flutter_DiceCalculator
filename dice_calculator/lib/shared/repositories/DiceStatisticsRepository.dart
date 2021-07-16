import 'package:dice_calculator/shared/models/DiceStatistics.dart';

class DiceStatisticsRepository {
  static final DiceStatisticsRepository _singleton =
      DiceStatisticsRepository._internal();

  factory DiceStatisticsRepository() {
    return _singleton;
  }

  DiceStatisticsRepository._internal() {}

  final dices = <DiceStatistics>[];

  void addStatistic({required String name, required int value}) {
    final dice = dices.firstWhere(
      (element) => element.name == name,
      orElse: () => DiceStatistics(name: name),
    );
    if (!dices.contains(dice)) {
      dices.add(dice);
    }
    dice.addData(value: value);
  }

  DiceStatistics getDice(String name) {
    final dice = dices.firstWhere(
      (element) => element.name == name,
      orElse: () => DiceStatistics(name: name),
    );
    return dice;
  }
}
