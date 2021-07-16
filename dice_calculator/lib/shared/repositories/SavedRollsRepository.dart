import 'package:dice_calculator/shared/models/SavedRoll.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedRollsRepository {
  static final _listKey = "SavedRolls";
  static final SavedRollsRepository _singleton =
      SavedRollsRepository._internal();

  factory SavedRollsRepository() {
    return _singleton;
  }

  SavedRollsRepository._internal() {
    _loadSavedRolls();
  }

  void _loadSavedRolls() async {
    final prefs = await _prefs;
    final listSaved = prefs.getStringList(_listKey);
    listSaved?.forEach((element) {
      var parts = element.split("|");
      if (parts.length == 2)
        addSavedRoll(
          name: parts[0],
          formula: parts[1],
          needSave: false,
        );
    });
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _savedRolls = <SavedRoll>[];

  void addSavedRoll({
    required String name,
    required String formula,
    bool needSave = true,
  }) {
    final savedRoll = _savedRolls.firstWhere(
      (element) => element.name == name,
      orElse: () => SavedRoll(name: name, formula: formula),
    );
    _savedRolls.remove(savedRoll);
    _savedRolls.add(SavedRoll(name: name, formula: formula));
    if (needSave) _saveSavedRolls();
  }

  void delSavedRoll({required String name}) {
    final savedRoll = _savedRolls.firstWhere(
      (element) => element.name == name,
      orElse: () => SavedRoll(name: name, formula: ""),
    );
    _savedRolls.remove(savedRoll);
    _saveSavedRolls();
  }

  void _saveSavedRolls() async {
    final prefs = await _prefs;
    final listSave = <String>[];
    _savedRolls.forEach(
        (element) => listSave.add("${element.name}|${element.formula}"));
    prefs.setStringList(_listKey, listSave);
  }

  List<SavedRoll> getAll() {
    _savedRolls.sort((a, b) => a.name.compareTo(b.name));
    return _savedRolls;
  }
}
