import 'package:dice_calculator/shared/keys/KeyboardKeys.dart';
import 'package:dice_calculator/shared/themes/AppColors.dart';
import 'package:dice_calculator/shared/themes/AppTextStyles.dart';
import 'package:flutter/material.dart';

class DiceButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const DiceButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textWidget = getTextWidget();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        border: Border.all(
          color: AppColors.stroke,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        child: textWidget,
      ),
    );
  }

  Widget getTextWidget() {
    if (label == KeyboardKeys.backspaceKey) {
      return Center(
        child: Icon(
          Icons.backspace,
          color: AppColors.secondary,
        ),
      );
    } else if (label == KeyboardKeys.cleanKey) {
      return Center(
        child: Icon(
          Icons.cleaning_services,
          color: AppColors.secondary,
        ),
      );
    }
    return Center(child: Text(label, style: AppTextStyles.diceButton));
  }
}
