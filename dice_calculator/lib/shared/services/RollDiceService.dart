import 'dart:math';

class RollDiceService {
  static int rolldice({required int sides}) {
    final rolledValue = Random.secure().nextInt(sides) + 1;
    return rolledValue;
  }
}
