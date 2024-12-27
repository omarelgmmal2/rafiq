import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/design/app_image.dart';
import 'package:rafiq_app/core/design/title_text.dart';
import 'package:rafiq_app/core/logic/helper_methods.dart';
import 'package:rafiq_app/core/utils/assets.dart';
import 'package:rafiq_app/core/utils/spacing.dart';
import 'package:rafiq_app/core/utils/text_style_theme.dart';
import 'package:rafiq_app/view/suggestions/suggestions_screen.dart';
import '../../core/design/app_button.dart';

class CompleteCash extends StatelessWidget {
  const CompleteCash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              verticalSpace(77),
              CustomTextWidget(
                label: "مبروك عليك!",
                style: TextStyleTheme.textStyle28SemiBold,
              ),
              Transform.translate(
                offset: const Offset(60, 50),
                child: AppImage(
                  AppImages.music,
                  height: 160.h,
                  width: 283.w,
                ),
              ),
              AppImage(
                AppImages.tabl,
                height: 352.h,
                width: 220.w,
              ),
              verticalSpace(65),
              AppButton(
                text: "كمّل فسحتك!",
                textStyle: TextStyleTheme.textStyle24Medium,
                buttonStyle: ElevatedButton.styleFrom(
                  fixedSize: Size(342.w, 55.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPress: () {
                  navigateTo(const SuggestionsScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
