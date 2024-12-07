import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/auth/login/login_screen.dart';
import 'package:rafiq_app/core/design/title_text.dart';
import 'package:rafiq_app/core/utils/text_style_theme.dart';
import '../../core/design/app_button.dart';
import '../../core/design/app_input.dart';
import '../../core/design/custom_app_bar.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/regex/app_regex.dart';
import '../../core/utils/app_color.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: CustomTextWidget(
              label: "إنشاء كلمة مرور جديدة",
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
                label: "كلمة المرور",
                style: TextStyleTheme.textStyle18Medium,
              ),
              AppInput(
                hintText: "كلمة المرور",
                controller: passwordController,
                textInputAction: TextInputAction.next,
                focusNode: passwordFocusNode,
                onFieldSubmitted: (value) {
                  FocusScope.of(context)
                      .requestFocus(confirmPasswordFocusNode);
                },
                isPassword: true,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isPasswordValid(value)) {
                    return "كلمه المرور غير صحيحه";
                  }
                  return null;
                },
                type: TextInputType.visiblePassword,
                paddingTop: 18.h,
                paddingBottom: 18.h,
              ),
              CustomTextWidget(
                label: "كلمة المرور مرة أخري",
                style: TextStyleTheme.textStyle18Medium,
              ),
              AppInput(
                hintText: "تاكيد كلمة المرور",
                controller: confirmPasswordController,
                textInputAction: TextInputAction.done,
                focusNode: confirmPasswordFocusNode,
                isPassword: true,
                validator: (value) {
                  if (value == null ||
                      value != passwordController.text ||
                      value.isEmpty ||
                      !AppRegex.isPasswordValid(value)) {
                    return "كلمه المرور غير متطابقه";
                  }
                  return null;
                },
                type: TextInputType.visiblePassword,
                paddingTop: 18.h,
                paddingBottom: 55.h,
              ),
              Center(
                child: AppButton(
                  text: "حفظ",
                  textStyle: TextStyleTheme.textStyle25Medium.copyWith(
                    color: AppColor.white,
                  ),
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      navigateTo(const LoginScreen());
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

