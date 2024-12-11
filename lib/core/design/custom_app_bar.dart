import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final Color? backgroundColor;
  final bool hideBack;
  final double? height;

  const CustomAppBar(
      {this.title,
      this.hideBack = false,
      this.action,
      this.backgroundColor,
      this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0.0,
      //centerTitle: true,
      automaticallyImplyLeading: false,
      toolbarHeight: height ?? 80.h,
      title: title ?? const Text(''),
      titleSpacing: 0,
      actions: [action ?? Container()],
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 25,
                color: Colors.black,
              ),
            ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 80.h);
}
