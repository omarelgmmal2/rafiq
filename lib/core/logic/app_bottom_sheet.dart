import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomSheet {

  static Future<void> display(BuildContext context,Widget widget) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25.r),
                topLeft: Radius.circular(25.r)
            )
        ),
        builder: (context) {
          return widget;
        },
    );
  }
}