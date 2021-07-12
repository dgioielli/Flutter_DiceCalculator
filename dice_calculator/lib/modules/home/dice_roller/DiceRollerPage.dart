import 'package:dice_calculator/modules/home/dice_roller/DiceRollerController.dart';
import 'package:dice_calculator/shared/services/RollDiceService.dart';
import 'package:dice_calculator/shared/themes/AppColors.dart';
import 'package:dice_calculator/shared/themes/AppTextStyles.dart';
import 'package:dice_calculator/shared/widgets/button_tile/diceButton.dart';
import 'package:flutter/material.dart';

class DiceRollerPage extends StatefulWidget {
  const DiceRollerPage({Key? key}) : super(key: key);

  @override
  _DiceRollerPageState createState() => _DiceRollerPageState();
}

class _DiceRollerPageState extends State<DiceRollerPage> {
  final controller = DiceRollerController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.resultNotifier,
      builder: (_, result, __) {
        return Container(
          color: AppColors.background,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 120,
                color: AppColors.backgroundInput,
                child: Center(
                  child: Text(
                    controller.result,
                    style: AppTextStyles.valueInput,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: GridView.count(
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: <Widget>[
                      DiceButton(
                          label: "D100",
                          onPressed: () => controller.rollDice(sides: 100)),
                      DiceButton(
                          label: "D20",
                          onPressed: () => controller.rollDice(sides: 20)),
                      DiceButton(
                          label: "D12",
                          onPressed: () => controller.rollDice(sides: 12)),
                      DiceButton(
                          label: "D10",
                          onPressed: () => controller.rollDice(sides: 10)),
                      DiceButton(
                          label: "D8",
                          onPressed: () => controller.rollDice(sides: 8)),
                      DiceButton(
                          label: "D6",
                          onPressed: () => controller.rollDice(sides: 6)),
                      DiceButton(
                          label: "D4",
                          onPressed: () => controller.rollDice(sides: 4)),
                      DiceButton(
                          label: "D3",
                          onPressed: () => controller.rollDice(sides: 3)),
                      DiceButton(
                          label: "D2",
                          onPressed: () => controller.rollDice(sides: 2)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
