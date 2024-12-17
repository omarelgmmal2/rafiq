import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/design/app_image.dart';
import '../../../core/design/title_text.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/spacing.dart';
import '../../../core/utils/text_style_theme.dart';
import '../../../models/suggestion_item_model/suggestion_item.dart';

class DetailsItem extends StatelessWidget {
  final SuggestionItemModel model;
  const DetailsItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 492.h,
      width: 358.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 183.h,
            width: 358.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: AppImage(
                model.image,
                height: 193.h,
                width: 358.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 3.w),
            margin: EdgeInsets.only(bottom: 10.h,top: 16.h),
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
          CustomTextWidget(
            label: model.body.toString(),
            style: TextStyleTheme.textStyle12Medium,
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
                style: TextStyleTheme.textStyle12Medium,
              ),
              const Spacer(),
              const Icon(
                Icons.location_on_outlined,
                color: AppColor.primary,
              ),
              horizontalSpace(5),
              CustomTextWidget(
                label: model.address,
                style: TextStyleTheme.textStyle12Medium,
              ),
            ],
          ),
          verticalSpace(10),
          Row(
            children: [
              CustomTextWidget(
                label: "(تقييم 4.1k)",
                style: TextStyleTheme.textStyle12Medium,
              ),
              CustomTextWidget(
                label: model.rate.toString(),
                style: TextStyleTheme.textStyle11Medium,
              ),
              const Icon(
                Icons.star,
                color: Colors.amberAccent,
                size: 15,
              ),
            ],
          ),
          verticalSpace(10),
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
    );
  }
}
