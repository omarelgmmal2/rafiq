import 'package:flutter/material.dart';
import 'package:rafiq_app/core/utils/assets.dart';

class SuggestionItemModel {
  final Color color;
  final String text,address,dateAndTime,image,icon,suggestionText;
  final int price;
  final double rate;

  SuggestionItemModel({
    required this.rate,
    required this.suggestionText,
    required this.icon,
    required this.image,
    required this.color,
    required this.text,
    required this.address,
    required this.dateAndTime,
    required this.price,
  });
}

final List<SuggestionItemModel> suggestionItemList = [
  SuggestionItemModel(
    rate: 4.3,
    icon: AppImages.entertaiment,
    image: AppImages.angham,
    suggestionText: "ترفيه",
    color: const Color(0xff0434C3),
    text: "ليلة طربية مع انغام",
    address: "مسرح المنارة, القاهرة",
    dateAndTime: "الخميس 23 نوفمبر , 8 مساءً",
    price: 250,
  ),
  SuggestionItemModel(
    rate: 4.5,
    icon: AppImages.ball,
    image: AppImages.padel,
    suggestionText: "رياضه",
    color: const Color(0xffB7280F),
    text: "حجز بادل",
    address: "طنطا , Smash Padel ",
    dateAndTime: "الاحد 1 ديسمبر , 5 مساءًً",
    price: 150,
  ),
  SuggestionItemModel(
    rate: 4.0,
    icon: AppImages.ball,
    image: AppImages.padel,
    suggestionText: "رياضه",
    color: Colors.orange,
    text: "حجز بادل",
    address: "طنطا , Smash Padel ",
    dateAndTime: "الاحد 1 ديسمبر , 5 مساءًً",
    price: 200,
  ),
];