import 'package:flutter/material.dart';
import 'package:muslim/Features/elquran/presentation/Views/quran_view.dart';
import 'package:muslim/Features/Home/home_view_muslim.dart';
import 'package:muslim/Features/hadith/presentation/View/hadith_view.dart';
import 'package:muslim/screen_test.dart';

const kPathNameSurah = 'assets/json/surahs.json';
const kPathSurah = 'json/Quran Suras/';
const kImageCardPath = 'assets/images/card.webp';

const Color kColorPrimary = Color(0xff1c302f);
const Color kColorSecondary = Color(0xffb0d3cb);
const Color kColorTertiary = Color(0xffb0d3cb);
const Color kColorAppBar = Color(0xff193834);
const Color kColorTextYalow = Color(0xffdbb859);
const Color kColorPrimary2 = Color(0xff14453c);

final List<Widget> pages = [
  const HomeViewMuslim(),
  const QuranView(),
  const HadithView(),
  const CourseDetailsScreen()
];

int hadithCount = 0;

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kColorPrimary,
    );
  }
}
