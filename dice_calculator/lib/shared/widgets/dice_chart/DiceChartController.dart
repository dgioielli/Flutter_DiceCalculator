import 'package:charts_flutter/flutter.dart' as charts;
import 'package:dice_calculator/shared/repositories/DiceStatisticsRepository.dart';

class DiceChartController {
  int getFontSize(String diceName) {
    final dice = DiceStatisticsRepository().getDice(diceName);
    if (dice.statistics.length < 21) {
      return 18;
    }
    final ratio = dice.statistics.length / 30.0;
    return 18 ~/ ratio;
  }

  List<charts.Series<dynamic, String>> getSeriesList(String diceName) {
    final dice = DiceStatisticsRepository().getDice(diceName);
    final data = dice.statistics
        .map(
          (e) => OrdinalDiceSides(
            "${e.value}",
            e.quantity,
          ),
        )
        .toList();

    return [
      charts.Series<OrdinalDiceSides, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalDiceSides sales, _) => sales.side,
        measureFn: (OrdinalDiceSides sales, _) => sales.numRolls,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalDiceSides {
  final String side;
  final int numRolls;

  OrdinalDiceSides(this.side, this.numRolls);
}
