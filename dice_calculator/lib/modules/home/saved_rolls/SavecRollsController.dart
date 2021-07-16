import 'package:dice_calculator/shared/models/SavedRoll.dart';
import 'package:dice_calculator/shared/repositories/SavedRollsRepository.dart';

class SavedRollsController {
  final savedRollsRepository = SavedRollsRepository();

  List<SavedRoll> getAllHistory() {
    return savedRollsRepository.getAll();
  }
}
