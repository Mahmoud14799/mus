import 'package:flutter/material.dart';

class DotSwitch extends StatelessWidget {
  final int currentPage;
  final int totalPages; // عدد الصفحات

  const DotSwitch(
      {super.key, required this.currentPage, required this.totalPages});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(growable: true, totalPages, (index) {
          final reversedIndex = totalPages - index - 1;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: currentPage == reversedIndex
                ? 30
                : 10, // تغيير الحجم حسب الصفحة الحالية
            height: 5,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: currentPage == reversedIndex ? Colors.amber : Colors.white,
            ),
          );
        }),
      ),
    );
  }
}
