import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/design/title_text.dart';
import 'package:rafiq_app/core/utils/text_style_theme.dart';
import '../../core/design/app_button.dart';
import '../../core/design/app_input.dart';
import '../../core/design/custom_app_bar.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/regex/app_regex.dart';
import '../../core/utils/app_color.dart';
import '../create_password/create_password_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: CustomTextWidget(
                label: "نسيت كلمة المرور",
              style: TextStyleTheme.textStyle22Medium,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 30.h),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                label: "البريد الالكتروني",
                style: TextStyleTheme.textStyle18Medium,
              ),
              AppInput(
                hintText: "ادخل البريد الالكتروني او رقم الهاتف",
                controller: emailController,
                suffixIcon: const Icon(Icons.email_outlined,
                    color: AppColor.black),
                textInputAction: TextInputAction.done,
                focusNode: emailFocusNode,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isEmailValid(value)) {
                    return "بريدك الالكتروني او رقم الهاتف اللذي ادخلته غير صحيح";
                  }
                  return null;
                },
                type: TextInputType.emailAddress,
                paddingBottom: 55.h,
                paddingTop: 18.h,
              ),
              Center(
                child: AppButton(
                  text: "إرسال",
                  textStyle: TextStyleTheme.textStyle25Medium.copyWith(
                    color: AppColor.white,
                  ),
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      navigateTo(const CreatePasswordScreen());
                    }
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
