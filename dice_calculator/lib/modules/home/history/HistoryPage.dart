import 'package:dice_calculator/modules/home/history/HistoryController.dart';
import 'package:dice_calculator/shared/themes/AppColors.dart';
import 'package:dice_calculator/shared/widgets/history_tile/HistoryTile.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final controller = HistoryController();
  HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.background,
        child: Column(
          children: controller
              .getAllHistory()
              .map((e) => HistoryTile(model: e))
              .toList(),
        ),
      ),
    );
  }
}
