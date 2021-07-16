import 'package:dice_calculator/modules/home/calculator/CalculatorController.dart';
import 'package:dice_calculator/shared/keys/ResultKeys.dart';
import 'package:dice_calculator/shared/themes/AppColors.dart';
import 'package:dice_calculator/shared/themes/AppTextStyles.dart';
import 'package:flutter/material.dart';

class CalculatorDisplayWidget extends StatelessWidget {
  final controller = CalculatorController();
  CalculatorDisplayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundInput,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: controller.formulaInputNotfier,
              builder: (_, resultInputNotifier, __) {
                return Center(
                  child: Text(
                    controller.formulaInput,
                    style: AppTextStyles.valueInput,
                  ),
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: controller.resultInputNotifier,
              builder: (_, resultInputNotifier, __) {
                return Center(
                  child: Text(
                    controller.resultInput,
                    style: controller.resultInput == ResultKeys.invalid
                        ? AppTextStyles.resultInputError
                        : AppTextStyles.resultInput,
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
