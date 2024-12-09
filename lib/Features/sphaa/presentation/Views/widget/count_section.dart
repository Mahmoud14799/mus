import 'package:flutter/material.dart';

Row countSection(int currentCount, int totalCount) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        'عدد الحبات\n\n ${totalCount.toString()}',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'cairo',
          fontSize: 20,
        ),
      ),
      Text(
        'العدد الحالي \n\n ${currentCount.toString()}',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'cairo',
          fontSize: 20,
        ),
      ),
    ],
  );
}
