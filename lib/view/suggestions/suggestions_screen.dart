import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/design/custom_app_bar.dart';
import 'package:rafiq_app/core/design/title_text.dart';
import 'package:rafiq_app/core/logic/helper_methods.dart';
import 'package:rafiq_app/core/utils/text_style_theme.dart';
import 'package:rafiq_app/models/suggestion_item_model/suggestion_item.dart';
import 'package:rafiq_app/view/profile/profile_page.dart';
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
            onPressed: () {
              navigateTo(const ProfilePage());
            },
            icon: Container(
              height: 40.h,
              width: 40.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://instagram.fpsd2-1.fna.fbcdn.net/v/t51.2885-19/429067138_1183292439220508_4696462981903639564_n.jpg?_nc_ht=instagram.fpsd2-1.fna.fbcdn.net&_nc_cat=108&_nc_ohc=dPltHIu5GIIQ7kNvgGr-Xxm&_nc_gid=9590f8cc2a9b49e587e55d9054f2f95a&edm=APoiHPcBAAAA&ccb=7-5&oh=00_AYDiNeVmWjp57EEp_aEwp0LgTPpLX1ro09sV-W5JElPQHg&oe=6770CA35&_nc_sid=22de04",
                  ),
                ),
              ),
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
              itemBuilder: (context, index) => Center(
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
