import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart';
import 'package:dice_calculator/shared/themes/AppColors.dart';
import 'package:dice_calculator/shared/widgets/dice_chart/DiceChartController.dart';
import 'package:flutter/material.dart';

class DiceChartWidget extends StatelessWidget {
  final controller = DiceChartController();
  final String diceName;
  DiceChartWidget({Key? key, required this.diceName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      controller.getSeriesList(diceName),
      vertical: false,
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(
          labelStyle: charts.TextStyleSpec(
            color: charts.ColorUtil.fromDartColor(AppColors.secondary),
            fontSize: controller.getFontSize(diceName),
          ),
        ),
      ),
      primaryMeasureAxis: charts.NumericAxisSpec(
        renderSpec: charts.GridlineRendererSpec(
          labelStyle: charts.TextStyleSpec(
            color: charts.ColorUtil.fromDartColor(AppColors.secondary),
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
