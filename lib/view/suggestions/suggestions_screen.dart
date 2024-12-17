import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/design/app_image.dart';
import 'package:rafiq_app/core/design/custom_app_bar.dart';
import 'package:rafiq_app/core/design/title_text.dart';
import 'package:rafiq_app/core/logic/helper_methods.dart';
import 'package:rafiq_app/core/utils/assets.dart';
import 'package:rafiq_app/core/utils/text_style_theme.dart';
import 'package:rafiq_app/models/suggestion_item_model/suggestion_item.dart';
import 'package:rafiq_app/view/suggestions/widget/custom_suggestion_container.dart';
import 'package:rafiq_app/view/details/details_page.dart';
import 'package:rafiq_app/view/suggestions/widget/suggestion_item.dart';
import '../../core/utils/app_color.dart';
import '../../models/suggestion_item_model/suggestion.dart';

class SuggestionsScreen extends StatelessWidget {
  const SuggestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CustomAppBar(
        backgroundColor: AppColor.ofWhite,
        action: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: IconButton(
            onPressed: () {},
            icon: AppImage(
              AppImages.search,
              height: 24.h,
              width: 24.h,
            ),
          ),
        ),
        title: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: CustomTextWidget(
              label: "الاقتراحات",
              style: TextStyleTheme.textStyle24Medium.copyWith(
                color: AppColor.black,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(16.h),
            margin: EdgeInsets.only(bottom: 24.h),
            height: 65.h,
            color: AppColor.primary,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  Center(
                    child: SuggestionItem(
                      model: suggestionList[index],
                    ),
                  ),
              itemCount: suggestionList.length,
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                navigateTo(
                  DetailsPage(
                      model: suggestionItemList[index],
                    ),
                );
              },
              child: CustomSuggestionContainer(
                model: suggestionItemList[index],
              ),
            ),
            itemCount: suggestionItemList.length,
          ),
        ],
      ),
    );
  }
}