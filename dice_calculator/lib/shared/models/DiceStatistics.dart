import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

class DiceStatistics {
  final String name;
  final statistics = <Statistic>[];

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  DiceStatistics({required this.name});

  void addData({required int value, int quantity = 1}) {
    final statistic = statistics.firstWhere(
      (element) => element.value == value,
      orElse: () => Statistic(value: value, quantity: quantity),
    );
    if (!statistics.contains(statistic)) {
      statistics.add(statistic);
    } else {
      statistic.quantity += quantity;
    }
    statistics.sort((a, b) => a.value.compareTo(b.value));
    _saveData(value, statistic.quantity);
  }

  void _saveData(int value, int quantity) async {
    final prefs = await _prefs;
    prefs.setInt("${name} - ${value}", quantity);
  }

  int totalSamples() {
    var count = 0;
    statistics.forEach((element) => count += element.quantity);
    return count;
  }

  double average() {
    var sum = 0;
    statistics.forEach((element) => sum += element.quantity * element.value);
    return sum / totalSamples().toDouble();
  }

  double variation() {
    var sum = 0;
    statistics.forEach(
        (element) => sum += element.quantity * element.value * element.value);
    final meanSquared = sum / totalSamples().toDouble();
    final mean = average();
    return sqrt((meanSquared - (mean * mean)).abs()) /
        totalSamples().toDouble();
  }
}

class Statistic {
  final int value;
  int quantity;

  Statistic({required this.value, required this.quantity});
}
