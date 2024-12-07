import 'package:flutter/material.dart';
import 'package:muslim/Features/hadith/presentation/View/widget/nested_scrol_view_hadith.dart';
import 'package:muslim/core/utils/constantes.dart';

class HadithView extends StatelessWidget {
  const HadithView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffb0d3cb),
        appBar: appBar(),
        body: const NestedScrollViewHadith());
  }

  AppBar appBar() {
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: const Color(0xffb0d3cb),
      centerTitle: true,
      title: const Text(
        'حديث شريف ',
        style: TextStyle(
          fontFamily: 'Cairo',
          fontSize: 20,
          color: kColorPrimary,
        ),
      ),
    );
  }
}
