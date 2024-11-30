import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/design/app_image.dart';
import '../../../core/utils/app_color.dart';

class StepperComponent extends StatelessWidget {
  final int index;
  final String icon;
  final int currentIndex;
  final VoidCallback onTap;
  final bool isLast;

  const StepperComponent({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.onTap,
    this.isLast = false,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return isLast
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      height: 50.h,
                      width: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color: currentIndex >= index
                            ? AppColor.primary
                            : AppColor.ofWhite,
                        border: Border.all(
                          color: currentIndex >= index
                              ? AppColor.primary
                              : AppColor.lightGray,
                        ),
                      ),
                      child: AppImage(
                        icon,
                        color: index == currentIndex
                            ? AppColor.ofWhite
                            : AppColor.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 2.h,
                    color: currentIndex >= index + 1
                        ? AppColor.primary
                        : AppColor.lightGray,
                  ),
                ],
              ),
            ],
          )
        : Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        height: 50.h,
                        width: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          color: currentIndex >= index
                              ? AppColor.primary
                              : AppColor.ofWhite,
                          border: Border.all(
                            color: currentIndex >= index
                                ? AppColor.primary
                                : AppColor.lightGray,
                          ),
                        ),
                        child: AppImage(
                          icon,
                          color: index == currentIndex
                              ? AppColor.ofWhite
                              : AppColor.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.w),
                        height: 2.h,
                        color: currentIndex >= index + 1
                            ? AppColor.primary
                            : AppColor.lightGray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
