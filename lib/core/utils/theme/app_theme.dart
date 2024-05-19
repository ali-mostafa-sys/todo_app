import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/utils/theme/colors.dart';

class AppColor
    with
        AppGryColor,
        AppOrangeColor,
        AppYellowColor,
        AppBlackColor,
        AppRedColor,
        AppGreenColor {}

final appTheme = ThemeData(
  /// text form field theme
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColor().fillColor,
    filled: true,
    contentPadding: EdgeInsetsDirectional.only(start: 21.w),
    hintStyle: TextStyle(
      fontSize: 14.sp,
      color: AppColor().textColor,
      fontWeight: FontWeight.w400,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.r),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.r),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.r),
      borderSide: const BorderSide(
          style: BorderStyle.solid, width: 1, color: Colors.red),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.r),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.r),
    ),
  ),
);
