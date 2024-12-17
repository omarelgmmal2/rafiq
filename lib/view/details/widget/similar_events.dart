import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/design/app_image.dart';
import '../../../core/design/title_text.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/spacing.dart';
import '../../../core/utils/text_style_theme.dart';
import '../../../models/suggestion_item_model/suggestion_item.dart';

class SimilarEvents extends StatelessWidget {
  const SimilarEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 315.h,
      width: 358.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            label: "فعاليات مشابهة",
            style: TextStyleTheme.textStyle18Medium,
          ),
          verticalSpace(10),
          SizedBox(
            height: 230.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => SimilarEventsItem(
                model: suggestionItemList[index],
              ),
              separatorBuilder: (context, index) => horizontalSpace(16),
              itemCount: suggestionItemList.length,
            ),
          ),
        ],
      ),
    );
  }
}

class SimilarEventsItem extends StatelessWidget {
  final SuggestionItemModel model;

  const SimilarEventsItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 220.h,
          width: 170.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
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
                height: 103.h,
                width: 358.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: AppImage(
                    model.image,
                    height: 103.h,
                    width: 177.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 0.w,
                child: Container(
                  margin: EdgeInsets.all(10.h),
                  padding: EdgeInsets.only(right: 5.w),
                  height: 16.h,
                  width: 41.w,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Row(
                    children: [
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
                top: 110.h,
                right: 8.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 3.w),
                      margin: EdgeInsets.only(bottom: 3.w),
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
                      style: TextStyleTheme.textStyle16Medium.copyWith(
                        color: AppColor.black,
                      ),
                    ),
                    verticalSpace(5),
                    CustomTextWidget(
                      label: "تبدأ من: ",
                      style: TextStyleTheme.textStyle12Medium,
                    ),
                    CustomTextWidget(
                      label: "${model.price} جنية مصري",
                      style: TextStyleTheme.textStyle16Medium.copyWith(
                        color: AppColor.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
