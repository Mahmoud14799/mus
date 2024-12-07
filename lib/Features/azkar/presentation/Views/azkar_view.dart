import 'package:flutter/material.dart';
import 'package:muslim/Features/azkar/presentation/Views/Widget/azkar_view_body.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff14453c),
        appBar: AppBar(
          backgroundColor: const Color(0xff14453c),
          centerTitle: true,
          title: const Text(
            'الاذكار',
            style: TextStyle(
              fontFamily: 'AppBarTitle',
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          forceMaterialTransparency: true,
        ),
        body: const AzkarViewBody());
  }
}
