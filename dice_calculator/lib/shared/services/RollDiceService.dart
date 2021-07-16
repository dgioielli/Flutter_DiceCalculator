import 'dart:math';

import 'package:dice_calculator/shared/repositories/DiceStatisticsRepository.dart';

class RollDiceService {
  static int rolldice({required int sides}) {
    final rolledValue = Random.secure().nextInt(sides) + 1;
    final statistics = DiceStatisticsRepository();
    statistics.addStatistic(name: "D${sides}", value: rolledValue);
    return rolledValue;
  }
}
