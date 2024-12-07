import 'package:flutter/material.dart';
import 'package:muslim/Features/sphaa/presentation/Views/widget/card_sphaa_view.dart';

class SphaaViewBody extends StatelessWidget {
  const SphaaViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: ListView(
        children: const [
          cardSphaa(
            title: 'الحمد لله',
          ),
          cardSphaa(title: 'سبحان الله'),
          cardSphaa(title: 'الله اكبر'),
          cardSphaa(title: 'استغفر الله العظيم'),
        ],
      ),
    );
  }
}
