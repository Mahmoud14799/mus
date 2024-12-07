import 'package:flutter/material.dart';
import 'package:muslim/Features/Home/presentation/View/widget/navigation_bar.dart';
import 'package:muslim/core/utils/constantes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kColorPrimary,
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(seconds: 5),
          transitionBuilder: (Widget child, Animation<double> animation) {
            final offsetAnimation = Tween<Offset>(
              begin: const Offset(1.0, .0), // الدخول من الجانب الأيمن
              end: Offset.zero,
            ).animate(animation);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          child: pages[_currentIndex], // التأكد من استخدام الصفحات المناسبة هنا
        ),
        bottomNavigationBar: CustomNavigationBarDemo(
          onItemTapped: onItemTapped,
          currentIndex: _currentIndex,
        ));
  }
}
