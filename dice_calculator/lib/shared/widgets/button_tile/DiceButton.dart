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
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          border: Border.all(
            color: AppColors.stroke,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(label, style: AppTextStyles.diceButton)),
      ),
    );
  }
}
