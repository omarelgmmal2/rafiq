import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/design/app_image.dart';
import 'package:rafiq_app/core/utils/spacing.dart';
import '../../../core/design/app_button.dart';
import '../../../core/design/title_text.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/text_style_theme.dart';
import '../../../models/suggestion_item_model/suggestion.dart';

class SuggestionItem extends StatelessWidget {
  final SuggestionModel model;

  const SuggestionItem({
    super.key,
    required this.model,
  });

  void showSelectedOption(BuildContext context, String selectedOption) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: CustomTextWidget(
              label: "تم اختيار: $selectedOption",
          ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showModalBottomSheet(
          context: context,
          builder: (context) => Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
            height: 460.h,
            decoration: BoxDecoration(
              color: AppColor.ofWhite,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.r),
                topLeft: Radius.circular(15.r),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomTextWidget(
                      label: model.text,
                      style: TextStyleTheme.textStyle22Medium,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CustomTextWidget(
                        label: "شيل الفلتر",
                        style: TextStyleTheme.textStyle22Medium.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(16),
                ...model.answer.map(
                  (e) {
                    return GestureDetector(
                      onTap: () {
                        showSelectedOption(context, e);
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 16.w,
                        ),
                        margin: EdgeInsets.only(bottom: 20.h),
                        height: 52.h,
                        width: 358.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: AppColor.white,
                          border: Border.all(
                            color: const Color(0xff000000),
                            width: 0.3,
                          ),
                        ),
                        child: CustomTextWidget(
                          label: e,
                          style: TextStyleTheme.textStyle20Medium.copyWith(
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                AppButton(
                  text: "تطبيق",
                  textStyle: TextStyleTheme.textStyle24Medium,
                  buttonStyle: ElevatedButton.styleFrom(
                    fixedSize: Size(342.w, 55.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPress: () {},
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 24.w),
        height: 40.h,
        width: 140.w,
        color: AppColor.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppImage(
                model.icon,
                height: 18.h,
                width: 18.h,
              ),
              CustomTextWidget(
                label: model.text,
                style: TextStyleTheme.textStyle16Regular,
              ),
              const Icon(
                Icons.arrow_drop_down,
                color: AppColor.gray,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ...List.generate(
//     4,
//   (index) => GestureDetector(
//     onTap: () {
//       setState(() {
//         currentIndex = index;
//       });
//     },
//     child: Container(
//       padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 16.w),
//       margin: EdgeInsets.only(bottom: 20.h),
//       height: 52.h,
//       width: 358.w,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15.r),
//         color:
//         currentIndex == index ? AppColor.primary : AppColor.white,
//         border: Border.all(
//           color: currentIndex == index
//               ? AppColor.primary
//               : const Color(0xff000000),
//           width: 0.3,
//         ),
//       ),
//       child: CustomTextWidget(
//         label: widget.model.text,
//         style: TextStyleTheme.textStyle20Medium.copyWith(
//           color: currentIndex == index
//               ? AppColor.white
//               : const Color(0xff000000),
//         ),
//       ),
//     ),
//   ),
// ),
// AppButton(
//   text: "تطبيق",
//   textStyle: TextStyleTheme.textStyle24Medium,
//   buttonStyle: ElevatedButton.styleFrom(
//     fixedSize: Size(342.w, 55.h),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(8.r),
//     ),
//   ),
//   onPress: () {},
// ),
