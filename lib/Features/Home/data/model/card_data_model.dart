import 'package:flutter/material.dart';
import 'package:muslim/Features/azkar/presentation/Views/azkar_view.dart';
import 'package:muslim/Features/elquran/presentation/Views/quran_view.dart';
import 'package:muslim/Features/hadith/presentation/View/hadith_view.dart';
import 'package:muslim/Features/sphaa/presentation/Views/sphaa_view.dart';

class CardDataModel {
  String title;
  String image;
  Widget screen;

  CardDataModel(
      {required this.title, required this.image, required this.screen});
}

List<CardDataModel> CardData = [
  CardDataModel(
      title: "القران الكريم",
      image: "assets/images/image_card/quran.png",
      screen: const QuranView()),
  CardDataModel(
      title: "احاديث شريفه",
      image: "assets/images/image_card/hadith.png",
      screen: const HadithView()),
  CardDataModel(
      title: "اذكار وادعيه",
      image: "assets/images/image_card/azkar.png",
      screen: const AzkarView()),
  CardDataModel(
      title: " السبحه",
      image: "assets/images/image_card/salah.png",
      screen: const SphaaView()),
];
