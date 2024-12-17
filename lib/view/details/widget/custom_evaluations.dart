import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/design/title_text.dart';
import '../../../core/logic/helper_methods.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/spacing.dart';
import '../../../core/utils/text_style_theme.dart';
import '../../evaluations/evaluations_page.dart';

class CustomEvaluations extends StatelessWidget {
  const CustomEvaluations({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      width: 358.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                label: "التقييمات",
                style: TextStyleTheme.textStyle18Medium,
              ),
              horizontalSpace(5),
              Padding(
                padding: EdgeInsets.only(top: 4.0.h),
                child: CustomTextWidget(
                  label: "(تقييم 4.1k)",
                  style: TextStyleTheme.textStyle12Regular,
                ),
              ),
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
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                      AppImages.bird,
                    ),
                  ),
                  horizontalSpace(5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        label: "عصفور الجنة",
                        style: TextStyleTheme.textStyle16Medium.copyWith(
                          color: AppColor.black,
                        ),
                      ),
                      verticalSpace(3),
                      Row(
                        children: [
                          ...List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.yellow,
                            ),
                          ),
                          horizontalSpace(5),
                          CustomTextWidget(
                            label: "27/11/2020",
                            style: TextStyleTheme.textStyle11Medium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpace(17),
              CustomTextWidget(
                label:
                    "حفلة أسطورية بكل معنى الكلمة! صوت أنغام كان مليئًا بالإحساس وأخذنا في رحلة رائعة بين أغانيها الكلاسيكية والجديدة. الأجواء كانت ساحرة، والتنظيم كان ممتازًا. تجربة فنية لا تُنسى وأتمنى تكرارها قريبًا!",
                style: TextStyleTheme.textStyle12Regular,
              ),
            ],
          ),
          verticalSpace(20),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(0),
            ),
            onPressed: () {
              navigateTo(const EvaluationsPage());
            },
            child: CustomTextWidget(
              label: "شوف كل التقييمات",
              style: TextStyleTheme.textStyle18Medium.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
