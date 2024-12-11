import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/design/app_image.dart';
import '../../../core/design/title_text.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/spacing.dart';
import '../../../core/utils/text_style_theme.dart';
import '../../../models/suggestion_item_model/suggestion_item.dart';

class CustomSuggestionContainer extends StatelessWidget {
  final SuggestionItemModel model;
  const CustomSuggestionContainer({
    super.key, required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20.h,
        left: 14.w,
        right: 14.w,
      ),
      padding: EdgeInsets.only(bottom: 12.h),
      height: 405.h,
      width: 358.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0, 4),
            blurRadius: 7,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: 183.h,
            width: 358.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: AppImage(
                model.image,
                height: 183.h,
                width: 358.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 10.w,
            child: Container(
              margin: EdgeInsets.all(10.h),
              padding: EdgeInsets.only(right: 5.w),
              height: 16.h,
              width: 70.w,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Row(
                children: [
                  CustomTextWidget(
                    label: "(4.8)",
                    style: TextStyleTheme.textStyle11Medium.copyWith(
                      color: const Color(0xff000096).withOpacity(.59),
                    ),
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.amberAccent,
                    size: 15,
                  ),
                  CustomTextWidget(
                    label: model.rate.toString(),
                    style: TextStyleTheme.textStyle11Medium,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 195.h,
            right: 15.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 3.w),
                  margin: EdgeInsets.only(bottom: 10.h),
                  height: 29.h,
                  width: 75.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: model.color,
                  ),
                  child: Row(
                    children: [
                      AppImage(
                        model.icon,
                        color: AppColor.white,
                      ),
                      horizontalSpace(5),
                      CustomTextWidget(
                        label: model.suggestionText,
                        style: TextStyleTheme.textStyle16Medium,
                      ),
                    ],
                  ),
                ),
                CustomTextWidget(
                  label: model.text,
                  style: TextStyleTheme.textStyle20Bold,
                ),
                verticalSpace(10),
                Row(
                  children: [
                    const Icon(
                      Icons.alarm,
                      color: AppColor.primary,
                    ),
                    horizontalSpace(5),
                    CustomTextWidget(
                      label: model.dateAndTime,
                      style: TextStyleTheme.textStyle16Regular,
                    ),
                  ],
                ),
                verticalSpace(10),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: AppColor.primary,
                    ),
                    horizontalSpace(5),
                    CustomTextWidget(
                      label: model.address,
                      style: TextStyleTheme.textStyle16Regular,
                    ),
                  ],
                ),
                verticalSpace(5),
                CustomTextWidget(
                  label: "تبدأ من: ",
                  style: TextStyleTheme.textStyle16Medium.copyWith(
                    color: AppColor.gray,
                  ),
                ),
                CustomTextWidget(
                  label: "${model.price} جنية مصري",
                  style: TextStyleTheme.textStyle18Medium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
