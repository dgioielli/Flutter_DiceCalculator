import 'package:dice_calculator/modules/home/calculator/CalculatorController.dart';
import 'package:dice_calculator/shared/keys/KeyboardKeys.dart';
import 'package:dice_calculator/shared/keys/ResultKeys.dart';
import 'package:dice_calculator/shared/themes/AppColors.dart';
import 'package:dice_calculator/shared/themes/AppTextStyles.dart';
import 'package:dice_calculator/shared/widgets/button_tile/DiceButton.dart';
import 'package:dice_calculator/shared/widgets/calculator_display/CalculatorDisplayWidget.dart';
import 'package:dice_calculator/shared/widgets/calculator_keyboard/CalculatorKeyboardWidget.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CalculatorDisplayWidget(),
          Expanded(
            child: Container(
              child:
                  CalculatorKeyboardWidget(onPressed: controller.onPressedKey),
            ),
          ),
          Container(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: DiceButton(
                        label: "Roll",
                        onPressed: controller.rollFormula,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: DiceButton(
                        label: KeyboardKeys.saveKey,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
