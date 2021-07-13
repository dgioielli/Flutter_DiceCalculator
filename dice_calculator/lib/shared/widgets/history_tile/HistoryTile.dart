import 'package:dice_calculator/shared/models/HistoryModel.dart';
import 'package:flutter/material.dart';

class HistoryTile extends StatelessWidget {
  final HistoryModel model;
  const HistoryTile({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.value),
      subtitle: Text(model.key),
    );
  }
}
