import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/design/app_image.dart';
import '../../../core/design/title_text.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/spacing.dart';
import '../../../core/utils/text_style_theme.dart';
import '../../../models/step_three_model/step_three_model.dart';

class StepThree extends StatefulWidget {
  const StepThree({super.key});

  @override
  State<StepThree> createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {

  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      children: [
        CustomTextWidget(
          label: "عايز تعمل ايه؟",
          style: TextStyleTheme.textStyle30Medium,
        ),
        verticalSpace(50),
        ...List.generate(
          stepThreeList.length,
              (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: Container(
                padding: EdgeInsets.only(right: 20.w, top: 7.h),
                margin: EdgeInsets.only(bottom: 35.h),
                height: 45.h,
                width: 342.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color:
                  currentIndex == index ? AppColor.primary : AppColor.white,
                  border: Border.all(
                    color: currentIndex == index
                        ? AppColor.primary
                        : const Color(0xff000000),
                    width: 0.3,
                  ),
                ),
                child: Row(
                  children: [
                    AppImage(
                        stepThreeList[index].icon??"",
                      color: currentIndex == index
                          ? AppColor.white
                          : const Color(0xff000000),
                    ),
                    horizontalSpace(7),
                    CustomTextWidget(
                      label: stepThreeList[index].text,
                      style: TextStyleTheme.textStyle20Medium.copyWith(
                        color: currentIndex == index
                            ? AppColor.white
                            : const Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
