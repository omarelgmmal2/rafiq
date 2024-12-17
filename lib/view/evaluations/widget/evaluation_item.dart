import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/design/title_text.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/text_style_theme.dart';
import '../../../models/evaluations_model/evaluations_model.dart';

class EvaluationItem extends StatelessWidget {
  final EvaluationsModel model;

  const EvaluationItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24.w),
      height: 40.h,
      width: 140.w,
      color: AppColor.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextWidget(
              label: model.text,
              style: TextStyleTheme.textStyle16Regular,
            ),
          ],
        ),
      ),
    );
  }
}
