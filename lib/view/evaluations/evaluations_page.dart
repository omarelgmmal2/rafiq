import 'package:flutter/material.dart';
import '../../core/design/custom_app_bar.dart';
import '../../core/design/title_text.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/text_style_theme.dart';

class EvaluationsPage extends StatelessWidget {
  const EvaluationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CustomAppBar(
        backgroundColor: AppColor.ofWhite,
        title: Align(
          alignment: AlignmentDirectional.centerStart,
          child: CustomTextWidget(
            label: "التقييمات",
            style: TextStyleTheme.textStyle24Medium.copyWith(
              color: AppColor.black,
            ),
          ),
        ),
      ),
      body: ListView(
        children: const [],
      ),
    );
  }
}

//جزء عرض التقيم سلبي - ايجابي - الكل
// Container(
//   padding: EdgeInsets.all(16.h),
//   margin: EdgeInsets.only(bottom: 24.h),
//   height: 65.h,
//   color: AppColor.primary,
//   child: ListView.builder(
//     scrollDirection: Axis.horizontal,
//     itemBuilder: (context, index) =>
//         Center(
//           child: EvaluationItem(
//             model: evaluationsList[index],
//           ),
//         ),
//     itemCount: evaluationsList.length,
//   ),
// ),
