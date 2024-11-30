import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/design/app_image.dart';
import '../../../../../core/utils/spacing.dart';
import '../design/title_text.dart';
import '../utils/assets.dart';
import '../utils/text_style_theme.dart';

class MyAppMethods {
  static Future<void> showErrorORWarningDialog({
    required BuildContext context,
    required String subtitle,
    required Function function,
    bool isError = true,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0.r),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppImage(
                AppImages.warning,
                height: 60.h,
                width: 60.w,
              ),
              verticalSpace(16),
              CustomTextWidget(
                  label: subtitle, style: TextStyleTheme.textStyle18Medium),
              verticalSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: !isError,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: CustomTextWidget(
                        label: "Cancel",
                        style: TextStyleTheme.textStyle18Medium.copyWith(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  horizontalSpace(20),
                  TextButton(
                    onPressed: () {
                      function();
                      Navigator.pop(context);
                    },
                    child: CustomTextWidget(
                      label: "OK",
                      style: TextStyleTheme.textStyle18Medium.copyWith(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
