import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/design/app_input.dart';
import 'package:rafiq_app/core/utils/text_style_theme.dart';
import '../../../core/design/custom_app_bar.dart';
import '../../../core/utils/app_color.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({super.key});

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CustomAppBar(
        backgroundColor: AppColor.ofWhite,
        title: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: AppInput(
            hintText: "بتدور علي اية ؟",
            controller: searchController,
            textStyle: TextStyleTheme.textStyle15Regular.copyWith(
              color: const Color(0xffCDC9C9),
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Color(0xffCDC9C9),
            ),
            type: TextInputType.text,
            textInputAction: TextInputAction.done,
            onChanged: (p0) {},
            onFieldSubmitted: (p0) {},
            fillColor: AppColor.white,
            isFilled: true,
            paddingTop: 16.h,
          ),
        ),
      ),
    );
  }
}
