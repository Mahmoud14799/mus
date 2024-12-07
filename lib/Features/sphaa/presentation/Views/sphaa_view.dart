import 'package:flutter/material.dart';
import 'package:muslim/Features/sphaa/presentation/Views/widget/sphaa_view_body.dart';

class SphaaView extends StatelessWidget {
  const SphaaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c302f),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff14453c),
        title: const Text(
          " المسبحه الالكترونيه",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontFamily: 'AppBarTitle'),
        ),
      ),
      body: const SphaaViewBody(),
    );
  }
}
