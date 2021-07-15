import 'package:dice_calculator/shared/models/DiceKey.dart';
import 'package:dice_calculator/shared/widgets/button_tile/DiceButton.dart';
import 'package:flutter/material.dart';

class DiceKeyboardWidget extends StatelessWidget {
  final void Function({required int sides}) onPressed;
  const DiceKeyboardWidget({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final diceKeys = [
      DiceKey(name: "D100", sides: 100),
      DiceKey(name: "D20", sides: 20),
      DiceKey(name: "D12", sides: 12),
      DiceKey(name: "D10", sides: 10),
      DiceKey(name: "D8", sides: 8),
      DiceKey(name: "D6", sides: 6),
      DiceKey(name: "D4", sides: 4),
      DiceKey(name: "D3", sides: 3),
      DiceKey(name: "D2", sides: 2),
    ];
    return Container(
      child: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: diceKeys
            .map((e) => DiceButton(
                  label: e.name,
                  onPressed: () => onPressed(sides: e.sides),
                ))
            .toList(),
      ),
    );
  }
}
