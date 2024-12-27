import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/auth/create_password/create_password_screen.dart';
import 'package:rafiq_app/core/utils/spacing.dart';
import '../../auth/login/login_screen.dart';
import '../../core/design/app_button.dart';
import '../../core/design/app_input.dart';
import '../../core/design/custom_app_bar.dart';
import '../../core/design/title_text.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/logic/my_app_methods.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/text_style_theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.ofWhite,
      appBar: CustomAppBar(
        backgroundColor: AppColor.primary,
        title: Align(
          alignment: AlignmentDirectional.centerStart,
          child: CustomTextWidget(
            label: "الملف الشخصي",
            style: TextStyleTheme.textStyle24Medium.copyWith(
              color: AppColor.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              verticalSpace(170),
              // حط هنا الكود بتاع الصوره
              verticalSpace(10),
              // لو عامل كود الاسم عندك امسح ده عادي
              CustomTextWidget(
                textAlign: TextAlign.center,
                label: "Ahmed Omar",
                style: TextStyleTheme.textStyle18Medium,
              ),
              verticalSpace(70),
              AppInput(
                fillColor: AppColor.white,
                isFilled: true,
                readOnly: true,
                hintText: "Ahmed Omar",
                prefixIcon: const Icon(
                  Icons.person_2_outlined,
                  color: AppColor.primary,
                ),
                paddingBottom: 16.h,
              ),
              AppInput(
                fillColor: AppColor.white,
                isFilled: true,
                readOnly: true,
                hintText: "ahmedomar1907@gmail.com",
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: AppColor.primary,
                ),
                paddingBottom: 16.h,
              ),
              TextFormField(
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff000000).withOpacity(.70),
                ),
                obscureText: true,
                readOnly: true,
                decoration: InputDecoration(
                  fillColor: AppColor.white,
                  filled: true,
                  hintText: "*********",
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: AppColor.primary,
                  ),
                  suffixIcon: IconButton(
                    onPressed: (){
                      navigateTo(const CreatePasswordScreen());
                    },
                    icon: const Icon(
                      Icons.edit_outlined,
                      color: AppColor.primary,
                    ),
                  ),
                ),
              ),
              verticalSpace(80),
              Center(
                child: AppButton(
                  text: "تسجيل الخروج",
                  textStyle: TextStyleTheme.textStyle25Medium.copyWith(
                    color: AppColor.white,
                  ),
                  onPress: () {
                    MyAppMethods.showErrorORWarningDialog(
                      context: context,
                      subtitle: "هل تريد تسجيل الخروج بالفعل؟",
                      onPress: () => navigateTo(const LoginScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
