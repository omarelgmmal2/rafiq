import 'package:flutter/material.dart';
import '../../../core/design/title_text.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/spacing.dart';
import '../../../core/utils/text_style_theme.dart';
import '../../../models/evaluations_model/evaluations_item.dart';

class EvaluationItem extends StatelessWidget {
  final EvaluationsItemModel model;
  const EvaluationItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                model.image,
              ),
            ),
            horizontalSpace(5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  label: model.name,
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
                      label: model.date,
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
          label: model.body,
          style: TextStyleTheme.textStyle12Regular,
        ),
      ],
    );
  }
}
