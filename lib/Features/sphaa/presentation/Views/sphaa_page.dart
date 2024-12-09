import 'package:flutter/material.dart';
import 'package:muslim/Features/sphaa/data/sphaa_model.dart';
import 'package:muslim/core/utils/constantes.dart';

import 'widget/sphaa_page_body.dart';

class SPhaaPage extends StatelessWidget {
  const SPhaaPage({
    super.key,
    required this.sphaaModel,
  });
  final SphaaModel sphaaModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c302f),
      appBar: AppBar(
        title: const Text(
          "المسبحه",
          style: TextStyle(
            color: kColorSecondary,
            fontSize: 30,
            fontFamily: 'AppBarTitle',
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff193834),
      ),
      body: SphaaPageBody(
        sphaaModel: sphaaModel,
      ),
    );
  }
}
