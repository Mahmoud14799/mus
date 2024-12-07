import 'package:flutter/material.dart';
import 'package:muslim/core/helper/convart_to_arabic_number.dart';

class AzkarListItem extends StatelessWidget {
  final int index;
  final void Function() onTap;
  final String azkarName;

  const AzkarListItem({
    super.key,
    required this.index,
    required this.onTap,
    required this.azkarName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // الرقم
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  scale: 12,
                  'assets/images/download.webp',
                  color: Colors.blueGrey,
                ),
                Text(
                  index.toString().toArabicNumbers,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            // اسم الذكر
            Expanded(
              child: Text(
                azkarName,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'cairo',
                  color: Color(0xffdbb859),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis, // تقليم النص إذا كان طويلاً
              ),
            ),
          ].reversed.toList(), // لعكس العناصر
        ),
      ),
    );
  }
}
