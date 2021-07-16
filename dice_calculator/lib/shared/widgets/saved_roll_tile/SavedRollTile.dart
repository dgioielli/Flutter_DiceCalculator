import 'package:dice_calculator/shared/models/SavedRoll.dart';
import 'package:dice_calculator/shared/themes/AppColors.dart';
import 'package:dice_calculator/shared/themes/AppTextStyles.dart';
import 'package:flutter/material.dart';

class SavedRollTile extends StatelessWidget {
  final SavedRoll model;
  const SavedRollTile({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.stroke,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  model.name,
                  style: AppTextStyles.historyTileTitle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  model.formula,
                  style: AppTextStyles.historyTileSubTitle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
