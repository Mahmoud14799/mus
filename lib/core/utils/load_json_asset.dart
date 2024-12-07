// lib/services/quran_service.dart
import 'dart:convert';
import 'package:flutter/services.dart';

class QuranService {
  // دالة لتحميل بيانات السور من ملف JSON
  Future<List<dynamic>> loadSurahsJson() async {
    final String jsonString =
        await rootBundle.loadString('assets/json/surahs.json');
    return jsonDecode(jsonString) as List<dynamic>;
  }
}
