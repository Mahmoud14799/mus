import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

Widget dateSection() {
  HijriCalendar.setLocal('ar');
  var today = HijriCalendar.now();

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          today.fullDate(),
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 8.0), // إضافة مسافة بين الأيقونة والنص
        const Icon(
          Icons.calendar_month_outlined,
          color: Colors.teal,
          size: 20,
        ),
      ],
    ),
  );
}
