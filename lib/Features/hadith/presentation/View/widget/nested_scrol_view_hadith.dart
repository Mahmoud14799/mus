import 'package:flutter/material.dart';
import 'package:muslim/Features/hadith/presentation/View/widget/item_hadith_view.dart';
import 'package:muslim/core/helper/custom_card.dart';
import 'package:muslim/core/utils/constantes.dart';
import 'package:muslim/core/utils/hadith_name.dart';

class NestedScrollViewHadith extends StatelessWidget {
  const NestedScrollViewHadith({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        const SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: false, // لا يتم تثبيت الشريط عند التمرير
          floating: true, // يظهر الشريط عند التمرير للأعلى
          backgroundColor: kColorSecondary,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: CustomCard(
              imageText: '*',
              bgColor: kColorPrimary,
            ),
          ),
        ),
      ],
      body: Container(
        decoration: BoxDecoration(
            color: kColorSecondary,
            image: DecorationImage(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              opacity: .5,
              image: Image.asset('assets/images/hiclipart.com.png').image,
            )),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: 8,
          itemBuilder: (context, index) {
            return ItemHadithView(
              hadithCount: hadithNameMap[hadithNameList[index]]?['count'] ?? 0,
              hadithName: hadithNameMap[hadithNameList[index]]?['name'] ?? '',
              source: hadithNameList[index],
            );
          },
          separatorBuilder: (context, index) => const Divider(
            color: Colors.grey, // لون الخط
            thickness: 0.5, // سمك الخط
            indent: 20, // المسافة من بداية الخط
            endIndent: 20, // المسافة من نهاية الخط
          ),
        ),
      ),
    );
  }
}
