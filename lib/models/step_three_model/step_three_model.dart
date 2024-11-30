import 'package:rafiq_app/core/utils/assets.dart';

class StepThreeModel {
  final String text;
  final String? icon;

  StepThreeModel({
    required this.text,
    this.icon,
  });
}

List<StepThreeModel> stepThreeList = [
  StepThreeModel(
    text: "ترفية",
    icon: AppImages.entertaiment
  ),
  StepThreeModel(
    text: "طعام",
      icon: AppImages.eating
  ),
  StepThreeModel(
    text: "انشطة خارجية",
      icon: AppImages.activities
  ),
  StepThreeModel(
    text: "الرياضة",
      icon: AppImages.sports
  ),
  StepThreeModel(
    text: "فاجئني",
      icon: AppImages.surprise
  ),
];
