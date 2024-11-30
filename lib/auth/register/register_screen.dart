import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/auth/login/login_screen.dart';
import '../../core/design/app_button.dart';
import '../../core/design/app_image.dart';
import '../../core/design/app_input.dart';
import '../../core/design/title_text.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/regex/app_regex.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/spacing.dart';
import '../../core/utils/text_style_theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameFocusNode = FocusNode();
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
                          label: "إنشاء حساب",
                          style: TextStyleTheme.textStyle35Medium,
                        ),
                      ),
                      verticalSpace(30),
                      AppInput(
                        hintText: "اسم المستخدم",
                        controller: userNameController,
                        suffixIcon: const Icon(Icons.person_2_outlined,
                            color: AppColor.black),
                        textInputAction: TextInputAction.next,
                        focusNode: userNameFocusNode,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(emailFocusNode);
                        },
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !AppRegex.isUserNameValid(value)) {
                            return "اسمك اللذي ادخلته غير صحيح";
                          }
                          return null;
                        },
                        type: TextInputType.name,
                        paddingBottom: 16.h,
                      ),
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
                            return "بريدك الالكتروني غير صحيح";
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
                        paddingBottom: 40.h,
                      ),
                      Center(
                        child: AppButton(
                          text: "تسجيل",
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
                      verticalSpace(30),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "بالفعل لديك حساب؟ ",
                                style:
                                    TextStyleTheme.textStyle15Regular.copyWith(
                                  color: AppColor.black,
                                ),
                              ),
                              TextSpan(
                                  text: "تسجيل الدخول",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      navigateTo(const LoginScreen());
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
