class StepTwoModel {
  final String text;
  final String? icon;

  StepTwoModel({
    required this.text,
    this.icon,
  });
}

List<StepTwoModel> stepTwoList = [
  StepTwoModel(text: "اقل من 100  جنية"),
  StepTwoModel(text: " 100 الي 500 جنية"),
  StepTwoModel(text: " 500 الي 1000 جنية"),
  StepTwoModel(text: " 1000 الي 1500 جنية"),
  StepTwoModel(text: "لسة محددتش"),
];
