import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/view/home/home_view.dart';
import 'core/logic/helper_methods.dart';
import 'core/themes/theme_services.dart';
import 'core/utils/app_strings.dart';
import 'on_boarding/on_boarding_screen.dart';

class RafiqApp extends StatelessWidget {
  const RafiqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: AppStrings.appName,
        theme: ThemeServices().lightTheme,
        debugShowCheckedModeBanner: false,
        //useInheritedMediaQuery: true,
        builder: (context, child) =>
            Directionality(textDirection: TextDirection.rtl, child: child!),
        //builder: DevicePreview.appBuilder,
        checkerboardOffscreenLayers: true,
        locale: DevicePreview.locale(context),
        navigatorKey: navigatorKey,
        home: child,
      ),
      child: const HomeView(),
    );
  }
}
