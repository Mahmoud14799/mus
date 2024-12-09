import 'package:flutter/material.dart';

class CardSphaaPage extends StatelessWidget {
  const CardSphaaPage({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      color: const Color(0xff152625),
      elevation: 2,
      child: SizedBox(
        height: 120, // طول الكارد
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                  size: 30,
                  Icons.arrow_circle_left_outlined,
                  color: Colors.white),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'title',
                ),
              ),
              const Icon(
                  size: 30,
                  Icons.arrow_circle_right_outlined,
                  color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
