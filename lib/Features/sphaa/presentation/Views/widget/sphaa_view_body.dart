import 'package:flutter/material.dart';
import 'package:muslim/Features/sphaa/data/sphaa_model.dart';
import 'package:muslim/Features/sphaa/presentation/Views/widget/card_sphaa_view.dart';

class SphaaViewBody extends StatelessWidget {
  const SphaaViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: sphaaList.length,
        itemBuilder: (context, index) {
          var sphaa = sphaaList[index];
          return cardSphaa(
            sphaaModel: sphaa,
          );
        },
      ),
    );
  }
}
