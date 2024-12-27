import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/design/app_input.dart';
import 'package:rafiq_app/view/evaluations/widget/evaluation_item.dart';
import '../../core/design/custom_app_bar.dart';
import '../../core/design/title_text.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/font_weight_helper.dart';
import '../../core/utils/spacing.dart';
import '../../core/utils/text_style_theme.dart';
import '../../models/evaluations_model/evaluations_item.dart';

class EvaluationsPage extends StatefulWidget {
  const EvaluationsPage({super.key});

  @override
  State<EvaluationsPage> createState() => _EvaluationsPageState();
}

class _EvaluationsPageState extends State<EvaluationsPage> {

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      bottomNavigationBar: Container(
        height: 77.h,
        color: AppColor.ofWhite,
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 21.w,
                    left: 18.w,
                    top: 16.h,
                  ),
                  child: AppInput(
                    hintText: "قولنا رأيك !",
                    textStyle: TextStyleTheme.textStyle12Regular.copyWith(
                      color: const Color(0xff85847D),
                    ),
                    fillColor: AppColor.white,
                    controller: textController,
                    isFilled: true,
                    onChanged: (p0) {},
                    onFieldSubmitted: (p0) {},
                    type: TextInputType.text,
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 21.w),
              height: 45.h,
              width: 45.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primary,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send,
                  size: 25,
                  color: AppColor.ofWhite,
                ),
              ),
            ),
          ],
        ),
      ),
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
        padding: EdgeInsets.only(
          right: 16.w,
          left: 16.w,
          top: 26.h,
          bottom: 15.h,
        ),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                label: "الكل",
                style: TextStyleTheme.textStyle18Medium.copyWith(
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
              horizontalSpace(5),
              const Spacer(),
              const Icon(
                Icons.filter_list_outlined,
                size: 19,
                color: AppColor.black,
              ),
              horizontalSpace(5),
              CustomTextWidget(
                label: "الاكثر شعبية",
                style: TextStyleTheme.textStyle12Regular.copyWith(
                  color: AppColor.black,
                ),
              ),
            ],
          ),
          verticalSpace(16),
          SizedBox(
            height: 580.h,
            child: ListView.separated(
              itemBuilder: (context, index) => EvaluationItem(
                model: evaluationsItemList[index],
              ),
              separatorBuilder: (context, index) => verticalSpace(14),
              itemCount: evaluationsItemList.length,
            ),
          ),
        ],
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
//           child: CustomEvaluation(
//             model: evaluationsList[index],
//           ),
//         ),
//     itemCount: evaluationsList.length,
//   ),
// ),
