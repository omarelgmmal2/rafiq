import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/logic/helper_methods.dart';
import '../../../core/design/app_button.dart';
import '../../../core/design/app_image.dart';
import '../../../core/design/title_text.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/spacing.dart';
import '../../../core/utils/text_style_theme.dart';
import '../../../models/payments/payments_model.dart';
import '../../cash/cash_page.dart';

class CustomPayCash extends StatefulWidget {
  const CustomPayCash({
    super.key,
  });

  @override
  State<CustomPayCash> createState() => _CustomPayCashState();
}

class _CustomPayCashState extends State<CustomPayCash> {
  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      height: 592.h,
      width: double.infinity.w,
      color: AppColor.ofWhite,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomTextWidget(
                label: "اختار طريقة الدفع",
                style: TextStyleTheme.textStyle20Bold,
              ),
            ),
            verticalSpace(15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 33.w),
              child: CustomTextWidget(
                label: "المحافظ الإلكترونية او البطاقات البنكية",
                style: TextStyleTheme.textStyle18Medium,
              ),
            ),
            verticalSpace(16),
            ...List.generate(
              paymentsList.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: Payments(
                    model: paymentsList[index],
                    color: currentIndex == index ? Colors.green : Colors.white,
                  ),
                );
              },
            ),
            verticalSpace(16),
            verticalSpace(13),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: AppButton(
                text: "اللي بعده",
                textStyle: TextStyleTheme.textStyle24Medium,
                buttonStyle: ElevatedButton.styleFrom(
                  fixedSize: Size(342.w, 55.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPress: () {
                  navigateTo(const CashPage());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Payments extends StatelessWidget {
  final PaymentsModel model;
  final Color color;

  const Payments({
    super.key,
    required this.model,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      margin: EdgeInsets.only(bottom: 16.h, right: 33.w, left: 33.w),
      height: 47.h,
      width: 326.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColor.white,
        border: Border.all(
          color: const Color(0xff000061).withOpacity(.38),
          width: 0.3,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 12.h,
            width: 12.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              border: Border.all(
                color: const Color(0xff85847D),
                width: 1,
              ),
            ),
          ),
          horizontalSpace(7),
          CustomTextWidget(
            label: model.text,
            style: TextStyleTheme.textStyle16Medium.copyWith(
              color: AppColor.black,
            ),
          ),
          const Spacer(),
          AppImage(
            model.icon,
            height: 28.h,
            width: 75.w,
          ),
        ],
      ),
    );
  }
}
