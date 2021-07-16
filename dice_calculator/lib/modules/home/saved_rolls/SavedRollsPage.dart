import 'package:dice_calculator/modules/home/saved_rolls/SavecRollsController.dart';
import 'package:dice_calculator/shared/themes/AppColors.dart';
import 'package:dice_calculator/shared/widgets/saved_roll_tile/SavedRollTile.dart';
import 'package:flutter/material.dart';

class SavedRollsPage extends StatelessWidget {
  final controller = SavedRollsController();
  SavedRollsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: controller
                .getAllHistory()
                .map((e) => SavedRollTile(model: e))
                .toList(),
          ),
        ),
      ),
    );
  }
}
