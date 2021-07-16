import 'package:charts_flutter/flutter.dart' as charts;
import 'package:dice_calculator/shared/repositories/DiceStatisticsRepository.dart';

class DiceChartController {
  int getFontSize(String diceName) {
    final dice = DiceStatisticsRepository().getDice(diceName);
    if (dice.statistics.length < 21) {
      return 18;
    }
    final ratio = dice.statistics.length / 30.0;
    return (18 / ratio).toInt();
  }

  List<charts.Series<dynamic, String>> getSeriesList(String diceName) {
    final dice = DiceStatisticsRepository().getDice(diceName);
    final data = dice.statistics
        .map(
          (e) => OrdinalSales(
            "${e.value}",
            e.quantity,
          ),
        )
        .toList();

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
