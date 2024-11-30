import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/auth/login/login_screen.dart';
import 'package:rafiq_app/core/design/app_button.dart';
import 'package:rafiq_app/core/design/app_image.dart';
import 'package:rafiq_app/core/design/title_text.dart';
import 'package:rafiq_app/core/logic/helper_methods.dart';
import 'package:rafiq_app/core/utils/app_color.dart';
import 'package:rafiq_app/core/utils/spacing.dart';
import 'package:rafiq_app/core/utils/text_style_theme.dart';
import 'package:rafiq_app/view/home/home_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../core/logic/cache_helper.dart';
import 'model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) => _ItemOnBoarding(
          model: onBoardingList[index],
        ),
        itemCount: onBoardingList.length,
        controller: boardController,
        onPageChanged: (value) {
          if (value == onBoardingList.length - 1) {
            isLast = true;
            setState(() {});
          } else {
            isLast = false;
            setState(() {});
          }
        },
      ),
    );
  }
}

bool isLast = false;
var boardController = PageController();

class _ItemOnBoarding extends StatelessWidget {
  final OnBoardingModel model;

  const _ItemOnBoarding({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 71.h,
        bottom: 58.h,
        left: 15.w,
        right: 15.w,
      ),
      child: Column(
        children: [
          Expanded(
            child: AppImage(
              model.image,
              height: 360.h,
              width: 360.h,
            ),
          ),
          verticalSpace(30),
          CustomTextWidget(
            textAlign: TextAlign.center,
            label: model.text,
            style: TextStyleTheme.textStyle30Medium,
          ),
          verticalSpace(16),
          CustomTextWidget(
            textAlign: TextAlign.center,
            label: model.body ?? "",
            style: TextStyleTheme.textStyle20Regular,
          ),
          isLast ? verticalSpace(30) : verticalSpace(90),
          isLast
              ? Column(
                  children: [
                    AppButton(
                      text: "يلا نبدا",
                      textStyle: TextStyleTheme.textStyle25Medium.copyWith(
                        color: AppColor.white,
                      ),
                      onPress: () {
                        navigateTo(
                          CacheHelper.isAuth()
                              ? const HomeView()
                              : const LoginScreen(),
                        );
                      },
                    ),
                    verticalSpace(70),
                    SmoothPageIndicator(
                      controller: boardController,
                      count: onBoardingList.length,
                      effect: ExpandingDotsEffect(
                        dotColor: AppColor.primary.withOpacity(.15),
                        dotHeight: 10.h,
                        dotWidth: 10.h,
                        expansionFactor: 4,
                        spacing: 5.0,
                        activeDotColor: AppColor.primary,
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        boardController.nextPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      },
                      child: CustomTextWidget(
                        label: "التالي",
                        style: TextStyleTheme.textStyle25Medium,
                      ),
                    ),
                    const Spacer(),
                    SmoothPageIndicator(
                      controller: boardController,
                      count: onBoardingList.length,
                      effect: ExpandingDotsEffect(
                        dotColor: AppColor.primary.withOpacity(.15),
                        dotHeight: 10.h,
                        dotWidth: 10.h,
                        expansionFactor: 4,
                        spacing: 5.0,
                        activeDotColor: AppColor.primary,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        navigateTo(
                          CacheHelper.isAuth()
                              ? const HomeView()
                              : const LoginScreen(),
                        );
                      },
                      child: CustomTextWidget(
                        label: "تخطي",
                        style: TextStyleTheme.textStyle25Medium,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
