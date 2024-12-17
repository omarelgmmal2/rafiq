import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/design/app_button.dart';
import 'package:rafiq_app/view/details/widget/custom_pay_cash.dart';
import 'package:rafiq_app/view/details/widget/details_item.dart';
import 'package:rafiq_app/view/details/widget/similar_events.dart';
import '../../core/design/custom_app_bar.dart';
import '../../core/design/title_text.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/text_style_theme.dart';
import '../../models/suggestion_item_model/suggestion_item.dart';
import 'widget/custom_divider.dart';
import 'widget/custom_evaluations.dart';

class DetailsPage extends StatelessWidget {
  final SuggestionItemModel model;

  const DetailsPage({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      bottomNavigationBar: Container(
        height: 100.h,
        color: AppColor.ofWhite,
        child: Center(
          child: AppButton(
            text: "احجز دلوقتي",
            textStyle: TextStyleTheme.textStyle24Medium,
            buttonStyle: ElevatedButton.styleFrom(
              fixedSize: Size(342.w, 55.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            onPress: () async {
              await showModalBottomSheet(
                context: context,
                builder: (context) => const CustomPayCash(),
              );
            },
          ),
        ),
      ),
      appBar: CustomAppBar(
        backgroundColor: AppColor.ofWhite,
        title: Align(
          alignment: AlignmentDirectional.centerStart,
          child: CustomTextWidget(
            label: "التفاصيل",
            style: TextStyleTheme.textStyle24Medium.copyWith(
              color: AppColor.black,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: 28.h),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: DetailsItem(model: model),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const CustomDivider(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const CustomEvaluations(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const CustomDivider(),
            ),
            const SimilarEvents(),
          ],
        ),
      ),
    );
  }
}
