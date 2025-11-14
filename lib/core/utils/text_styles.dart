import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_reader/core/utils/colors.dart';

abstract class AppTextStyles {
  static const TextStyle primary17W400 = TextStyle(
    color: AppColors.primary,
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle primary24W600 = TextStyle(
    color: AppColors.primary,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle primary26W500 = TextStyle(
    color: AppColors.primary,
    fontSize: 26,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle robotoWhite16W400 = TextStyle(
    color: AppColors.robotoWhite,
    fontSize: 16,
    fontFamily: GoogleFonts.roboto().fontFamily,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle robotoLightWhite14W400 = TextStyle(
    color: AppColors.robotoLightWhite,
    fontSize: 14,
    decoration: TextDecoration.none,
    fontFamily: GoogleFonts.roboto().fontFamily,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle white24W500 = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle white27W400 = TextStyle(
    color: Colors.white,
    fontSize: 27,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle white17W400 = TextStyle(
    color: Colors.white,
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle white16W400 = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle grey14W400 = TextStyle(
    fontSize: 14,
    color: AppColors.grey,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle grey13W400 = TextStyle(
    fontSize: 13,
    color: AppColors.grey,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle blackGreyish14W600 = TextStyle(
    fontSize: 14,
    color: AppColors.blackGreyish,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle blackGreyish16W400 = TextStyle(
    fontSize: 16,
    color: AppColors.blackGreyish,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle blackGreyish17W500 = TextStyle(
    fontSize: 17,
    color: AppColors.blackGreyish,
    fontWeight: FontWeight.w500,
  );
}
