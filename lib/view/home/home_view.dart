import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/auth/login/login_screen.dart';
import 'package:rafiq_app/core/design/app_button.dart';
import 'package:rafiq_app/core/logic/helper_methods.dart';
import 'package:rafiq_app/core/utils/assets.dart';
import 'package:rafiq_app/core/utils/spacing.dart';
import 'package:rafiq_app/core/utils/text_style_theme.dart';
import 'package:rafiq_app/view/home/widget/stepper_component.dart';
import 'package:rafiq_app/view/pages/step_one_screen/step_one_screen.dart';
import 'package:rafiq_app/view/pages/step_three_screen/step_three_screen.dart';
import 'package:rafiq_app/view/pages/step_two_screen/step_two_screen.dart';
import '../pages/step_four_screen/step_four_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  final pageController = PageController();
  List<Widget> pages = const [
    StepOne(),
    StepTwo(),
    StepThree(),
    StepFour(),
  ];

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          right: 24.w,
          left: 24.w,
          bottom: 47.h,
          top: 100.h,
        ),
        child: AppButton(
          text: currentIndex > 2 ? "فسحني!" : "اللي بعده",
          textStyle: TextStyleTheme.textStyle24Medium,
          buttonStyle: ElevatedButton.styleFrom(
            fixedSize: Size(342.w, 55.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          onPress: () {
            if (currentIndex < 3) {
              setState(
                () {
                  currentIndex = currentIndex += 1;
                },
              );
            }else if(currentIndex == 3){
              navigateTo(const LoginScreen());
            }
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            verticalSpace(15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              margin: EdgeInsets.only(bottom: 40.h),
              child: Row(
                children: [
                  StepperComponent(
                    currentIndex: currentIndex,
                    index: 0,
                    icon: AppImages.location,
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
                      });
                      pageController.jumpToPage(0);
                    },
                  ),
                  StepperComponent(
                    currentIndex: currentIndex,
                    index: 1,
                    icon: AppImages.dollar,
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                      });
                      pageController.jumpToPage(1);
                    },
                  ),
                  StepperComponent(
                    currentIndex: currentIndex,
                    index: 2,
                    icon: AppImages.entertainment,
                    onTap: () {
                      setState(() {
                        currentIndex = 2;
                      });
                      pageController.jumpToPage(2);
                    },
                  ),
                  StepperComponent(
                    currentIndex: currentIndex,
                    index: 3,
                    icon: AppImages.friends,
                    isLast: true,
                    onTap: () {
                      setState(() {
                        currentIndex = 3;
                      });
                      pageController.jumpToPage(3);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    if (index == currentIndex) {
                      pageController.jumpToPage(index);
                    }
                  },
                  child: pages[currentIndex],
                ),
                itemCount: 1,
                controller: pageController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}