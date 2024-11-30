import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:rafiq_app/rafiq_app.dart';
import 'core/logic/cache_helper.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Future.delayed(const Duration(seconds: 2), () {
    FlutterNativeSplash.remove();
  });
  await CacheHelper.init();
  runApp(const RafiqApp());
}
