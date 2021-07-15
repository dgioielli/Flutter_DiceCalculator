import 'package:dice_calculator/shared/models/HistoryModel.dart';
import 'package:dice_calculator/shared/repositories/HistoryRepository.dart';

class HistoryController {
  final historyRepository = HistoryRepository();

  List<HistoryModel> getAllHistory() {
    return historyRepository.getAll();
  }
}
