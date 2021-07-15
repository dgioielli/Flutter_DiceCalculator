import 'package:dice_calculator/modules/home/dice_roller/DiceRollerController.dart';
import 'package:dice_calculator/shared/services/RollDiceService.dart';
import 'package:dice_calculator/shared/themes/AppColors.dart';
import 'package:dice_calculator/shared/themes/AppTextStyles.dart';
import 'package:dice_calculator/shared/widgets/button_tile/diceButton.dart';
import 'package:dice_calculator/shared/widgets/dice_keyboard/DiceKeyboardWidget.dart';
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
                child: DiceKeyboardWidget(
                  onPressed: controller.rollDice,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
