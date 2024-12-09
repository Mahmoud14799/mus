import 'package:flutter/material.dart';
import 'package:muslim/Features/sphaa/data/sphaa_model.dart';
import 'package:muslim/Features/sphaa/presentation/Views/widget/page_view_card.dart';
import 'package:muslim/core/utils/constantes.dart';

import 'count_section.dart';
import 'sphaa_button.dart';

class SphaaPageBody extends StatefulWidget {
  const SphaaPageBody({
    super.key,
    required this.sphaaModel,
  });
  final SphaaModel sphaaModel;

  @override
  State<SphaaPageBody> createState() => _SphaaPageBodyState();
}

class _SphaaPageBodyState extends State<SphaaPageBody> {
  int currentCount = 0;
  int totalCount = 33;

  PageController controller = PageController(initialPage: 0);
  void onCount() {
    setState(() {
      if (currentCount < totalCount) {
        currentCount++;
      } else if (currentCount == totalCount) {
        controller.nextPage(
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        );
        currentCount = 0;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text(
            'تم الانتهاء من ',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          duration: const Duration(seconds: 4), // مدة العرض
          behavior: SnackBarBehavior.floating, // لجعل Snackbar عائمًا
          margin: const EdgeInsets.only(
              bottom: 100, left: 16, right: 16), // مكان Snackbar
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // لتدوير الحواف
          ),
          backgroundColor: const Color(
            0xffdbb859, // تغيير اللون الخلفي
          ),
        ));
      }
    });
  }

  void buttonRest() {
    setState(() {
      currentCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/image_card/bearish.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    kColorPrimary.withOpacity(.8),
                    kColorPrimary.withOpacity(1.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 140,
                    child: PageViewCard(controller: controller),
                  ),
                  const SizedBox(height: 16),
                  countSection(currentCount, totalCount),
                  const Spacer(),
                  // إزالة الزر المتحرك من العمود

                  buttonRestart(buttonRest),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),

            // الزر المتحرك في منتصف الشاشة
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Center(
                  child: SphaaButton(
                onTap: onCount,
              )),
            ),
          ],
        ),
      ],
    );
  }
}
