import 'package:dice_calculator/shared/models/HistoryModel.dart';

class HistoryRepository {
  static final HistoryRepository _singleton = HistoryRepository._internal();

  factory HistoryRepository() {
    return _singleton;
  }

  HistoryRepository._internal() {}

  final rollerList = <HistoryModel>[];
  final calculatorList = <HistoryModel>[];
  final fullList = <HistoryModel>[];
  int lenghtListsBase = 10;

  void addRollerItem(HistoryModel newModel) {
    rollerList.add(newModel);
    fullList.add(newModel);
    if (rollerList.length > lenghtListsBase) {
      rollerList.removeAt(0);
    }
  }

  void addCalculatorList(HistoryModel newModel) {
    calculatorList.add(newModel);
    fullList.add(newModel);
    if (calculatorList.length > lenghtListsBase) {
      calculatorList.removeAt(0);
    }
  }

  List<HistoryModel> getAll() => fullList;
}
