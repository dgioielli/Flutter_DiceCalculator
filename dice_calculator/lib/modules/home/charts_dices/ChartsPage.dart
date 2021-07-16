import 'package:dice_calculator/modules/home/charts_dices/ChartsController.dart';
import 'package:dice_calculator/shared/themes/AppColors.dart';
import 'package:dice_calculator/shared/themes/AppTextStyles.dart';
import 'package:dice_calculator/shared/widgets/dice_chart/DiceChartWidget.dart';
import 'package:dice_calculator/shared/widgets/dice_drop_down_button/DiceDropDownButton.dart';
import 'package:dice_calculator/shared/widgets/test_chart/testChart.dart';
import 'package:flutter/material.dart';

class ChartsPage extends StatefulWidget {
  ChartsPage({Key? key}) : super(key: key);

  @override
  _ChartsPageState createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  final controller = ChartsController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              child: DiceDropDownButton(
                options: controller.diceNames,
                onChanged: (value) {
                  controller.nameDice = value!;
                  setState(() {});
                },
                value: controller.nameDice,
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                controller.getDiceData(),
                style: AppTextStyles.historyTileSubTitle,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                //color: Colors.green,
                child: DiceChartWidget(
                  diceName: controller.nameDice,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
