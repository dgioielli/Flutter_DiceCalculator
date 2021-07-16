import 'package:dice_calculator/shared/themes/AppColors.dart';
import 'package:dice_calculator/shared/themes/AppTextStyles.dart';
import 'package:flutter/material.dart';

class DiceDropDownButton extends StatelessWidget {
  final List<String> options;
  final void Function(String?) onChanged;
  final String value;
  const DiceDropDownButton({
    Key? key,
    required this.options,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
        dropdownColor: AppColors.background,
        items: options.map((String dropDownStringItem) {
          return DropdownMenuItem<String>(
            value: dropDownStringItem,
            child: Container(
              child: Center(
                child: Text(
                  dropDownStringItem,
                  style: AppTextStyles.historyTileTitle,
                ),
              ),
            ),
          );
        }).toList(),
        onChanged: (value) => onChanged(value),
        value: value,
        isExpanded: true,
      ),
    );
  }
}
