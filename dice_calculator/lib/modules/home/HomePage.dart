import 'package:dice_calculator/modules/home/calculator/CalculatorPage.dart';
import 'package:dice_calculator/modules/home/charts_dices/ChartsPage.dart';
import 'package:dice_calculator/modules/home/dice_roller/DiceRollerPage.dart';
import 'package:dice_calculator/modules/home/history/HistoryPage.dart';
import 'package:dice_calculator/modules/home/saved_rolls/SavedRollsPage.dart';
import 'package:dice_calculator/shared/themes/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dice Calculator"),
          bottom: TabBar(
            indicatorColor: AppColors.secondary,
            labelColor: AppColors.secondary,
            indicatorWeight: 5,
            tabs: [
              Tab(icon: Icon(FontAwesomeIcons.diceD20)),
              Tab(icon: Icon(FontAwesomeIcons.calculator)),
              Tab(icon: Icon(FontAwesomeIcons.magic)),
              Tab(icon: Icon(FontAwesomeIcons.history)),
              Tab(icon: Icon(FontAwesomeIcons.chartBar)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DiceRollerPage(),
            CalculatorPage(),
            SavedRollsPage(),
            HistoryPage(),
            ChartsPage(),
          ],
        ),
      ),
    );
  }
}
