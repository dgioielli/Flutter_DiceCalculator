import 'package:dice_calculator/shared/keys/KeyboardKeys.dart';
import 'package:dice_calculator/shared/widgets/button_tile/DiceButton.dart';
import 'package:flutter/material.dart';

class CalculatorKeyboardWidget extends StatelessWidget {
  final void Function({required String key}) onPressed;
  const CalculatorKeyboardWidget({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final keys = [
      "D",
      "7",
      "8",
      "9",
      "+",
      "4",
      "5",
      "6",
      "-",
      "1",
      "2",
      "3",
      KeyboardKeys.backspaceKey,
      KeyboardKeys.cleanKey,
      "0",
      ";"
    ];
    return Container(
      child: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 4,
        children: keys
            .map((e) => DiceButton(
                  label: e,
                  onPressed: () => onPressed(key: e),
                ))
            .toList(),
      ),
    );
  }
}
