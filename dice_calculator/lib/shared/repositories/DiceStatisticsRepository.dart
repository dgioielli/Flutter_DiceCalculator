import 'package:dice_calculator/shared/models/DiceStatistics.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiceStatisticsRepository {
  static final DiceStatisticsRepository _singleton =
      DiceStatisticsRepository._internal();

  factory DiceStatisticsRepository() {
    return _singleton;
  }

  DiceStatisticsRepository._internal() {
    _loadDiceStatistics("D100", 100);
    _loadDiceStatistics("D20", 20);
    _loadDiceStatistics("D12", 12);
    _loadDiceStatistics("D10", 10);
    _loadDiceStatistics("D8", 8);
    _loadDiceStatistics("D6", 6);
    _loadDiceStatistics("D4", 4);
    _loadDiceStatistics("D3", 3);
    _loadDiceStatistics("D2", 2);
  }

  void _loadDiceStatistics(String dice, int sides) async {
    final prefs = await _prefs;
    for (int i = 1; i <= sides; i++) {
      final quantity = prefs.getInt("${dice} - ${i}");
      addStatistic(
        name: dice,
        value: i,
        quantity: quantity ?? 0,
      );
    }
  }

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final dices = <DiceStatistics>[];

  void addStatistic(
      {required String name, required int value, int quantity = 1}) {
    final dice = dices.firstWhere(
      (element) => element.name == name,
      orElse: () => DiceStatistics(name: name),
    );
    if (!dices.contains(dice)) {
      dices.add(dice);
    }
    dice.addData(value: value, quantity: quantity);
  }

  DiceStatistics getDice(String name) {
    final dice = dices.firstWhere(
      (element) => element.name == name,
      orElse: () => DiceStatistics(name: name),
    );
    return dice;
  }
}
