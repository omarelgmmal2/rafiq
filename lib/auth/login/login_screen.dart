import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/design/app_image.dart';
import 'package:rafiq_app/core/design/app_input.dart';
import 'package:rafiq_app/core/design/title_text.dart';
import 'package:rafiq_app/core/utils/app_color.dart';
import 'package:rafiq_app/core/utils/assets.dart';
import 'package:rafiq_app/core/utils/spacing.dart';
import 'package:rafiq_app/core/utils/text_style_theme.dart';
import '../../core/design/app_button.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/regex/app_regex.dart';
import '../../view/home/home_view.dart';
import '../forget_password/forget_password_screen.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: AppImage(
                    AppImages.logo,
                    height: 140.h,
                    width: 240.w,
                  ),
                ),
              ),
              verticalSpace(70),
              Container(
                padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 30.w),
                height: 538.h,
                width: double.infinity.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.r),
                    topLeft: Radius.circular(30.r),
                  ),
                  color: AppColor.ofWhite,
                ),
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      Center(
                        child: CustomTextWidget(
                          label: "تسجيل الدخول",
                          style: TextStyleTheme.textStyle35Medium,
                        ),
                      ),
                      verticalSpace(30),
                      AppInput(
                        hintText: "ادخل البريد الالكتروني او رقم الهاتف",
                        controller: emailController,
                        suffixIcon: const Icon(Icons.email_outlined,
                            color: AppColor.black),
                        textInputAction: TextInputAction.next,
                        focusNode: emailFocusNode,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(passwordFocusNode);
                        },
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !AppRegex.isEmailValid(value)) {
                            return "بريدك الالكتروني او رقم الهاتف اللذي ادخلته غير صحيح";
                          }
                          return null;
                        },
                        type: TextInputType.emailAddress,
                        paddingBottom: 16.h,
                      ),
                      AppInput(
                        hintText: "كلمة المرور",
                        controller: passwordController,
                        textInputAction: TextInputAction.done,
                        focusNode: passwordFocusNode,
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
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateTo(const ForgetPasswordScreen());
                        },
                        child: CustomTextWidget(
                          label: "هل نسيت كلمة المرور؟",
                          style: TextStyleTheme.textStyle15Medium,
                        ),
                      ),
                      verticalSpace(50),
                      Center(
                        child: AppButton(
                          text: "تسجيل الدخول",
                          textStyle: TextStyleTheme.textStyle25Medium.copyWith(
                            color: AppColor.white,
                          ),
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                              navigateTo(const HomeView());
                            }
                          },
                        ),
                      ),
                      verticalSpace(30),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "ليس لديك حساب ؟ ",
                                style:
                                    TextStyleTheme.textStyle15Regular.copyWith(
                                  color: AppColor.black,
                                ),
                              ),
                              TextSpan(
                                  text: "سجل الان",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      navigateTo(const RegisterScreen());
                                    },
                                  style: TextStyleTheme.textStyle15Regular),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
