import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/design/title_text.dart';
import 'package:rafiq_app/core/utils/app_color.dart';
import 'package:rafiq_app/core/utils/spacing.dart';
import 'package:rafiq_app/core/utils/text_style_theme.dart';
import '../../../models/step_one_model/step_one_model.dart';

class StepOne extends StatefulWidget {
  const StepOne({super.key});

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      children: [
        CustomTextWidget(
          label: "عايز تخرج فين ؟",
          style: TextStyleTheme.textStyle30Medium,
        ),
        verticalSpace(50),
        ...List.generate(
          stepOneList.length,
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
                child: CustomTextWidget(
                  label: stepOneList[index].text,
                  style: TextStyleTheme.textStyle20Medium.copyWith(
                    color: currentIndex == index
                        ? AppColor.white
                        : const Color(0xff000000),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
