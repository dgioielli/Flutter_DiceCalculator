import 'dart:math';

class DiceStatistics {
  final String name;
  final statistics = <Statistic>[];

  DiceStatistics({required this.name});

  void addData({required int value}) {
    final statistic = statistics.firstWhere(
      (element) => element.value == value,
      orElse: () => Statistic(value: value, quantity: 1),
    );
    if (!statistics.contains(statistic)) {
      statistics.add(statistic);
    } else {
      statistic.quantity += 1;
    }
    statistics.sort((a, b) => a.value.compareTo(b.value));
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
