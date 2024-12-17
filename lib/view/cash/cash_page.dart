import 'package:flutter/material.dart';
import '../../core/design/custom_app_bar.dart';
import '../../core/design/title_text.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/text_style_theme.dart';

class CashPage extends StatelessWidget {
  const CashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CustomAppBar(
        backgroundColor: AppColor.ofWhite,
        title: Align(
          alignment: AlignmentDirectional.centerStart,
          child: CustomTextWidget(
            label: "الدفع",
            style: TextStyleTheme.textStyle24Medium.copyWith(
              color: AppColor.black,
            ),
          ),
        ),
      ),
    );
  }
}
