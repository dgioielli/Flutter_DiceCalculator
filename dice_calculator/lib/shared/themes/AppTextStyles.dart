import 'package:dice_calculator/shared/themes/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final diceButton = GoogleFonts.varelaRound(
    fontSize: 25,
    fontWeight: FontWeight.w400,
    color: AppColors.secondary,
  );
  static final valueInput = GoogleFonts.varelaRound(
    fontSize: 35,
    fontWeight: FontWeight.w500,
    color: AppColors.secondary,
  );
  static final resultInput = GoogleFonts.varelaRound(
    fontSize: 30,
    fontWeight: FontWeight.w500,
    color: AppColors.secondary,
  );
  static final resultInputError = GoogleFonts.varelaRound(
    fontSize: 30,
    fontWeight: FontWeight.w500,
    color: AppColors.negative,
  );
  static final historyTileTitle = GoogleFonts.varelaRound(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.secondary,
  );
  static final historyTileSubTitle = GoogleFonts.varelaRound(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.secondary,
  );
}
