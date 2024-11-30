import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color.dart';
import 'font_weight_helper.dart';

class TextStyleTheme {

  static TextStyle textStyle16Light = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.light,
    color: AppColor.gray,
  );

  static TextStyle textStyle18Medium = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.black,
  );

  static TextStyle textStyle30Medium = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.black,
  );

  static TextStyle textStyle35Medium = TextStyle(
    fontSize: 35.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.black,
  );

  static TextStyle textStyle25Medium = TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.primary,
  );

  static TextStyle textStyle24Medium = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.white,
  );

  static TextStyle textStyle20Regular = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
    color: const Color(0xff000000).withOpacity(.75),
  );

  static TextStyle textStyle20Medium = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
    color: const Color(0xff000000).withOpacity(.75),
  );

  static TextStyle textStyle15Regular = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColor.primary,
  );

  static TextStyle textStyle15Medium = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.primary,
  );
}