import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:muslim/Features/elquran/data/models/surah_model.dart';

class AllSurahRepository {
  Future<List<SurahModel>> getAllSurah() async {
    List<SurahModel> allSurah = [];

    for (var i = 1; i < 114; i++) {
      String filePath = 'assets/json/Quran Suras/surah_$i.json';

      final String response = await rootBundle.loadString(filePath);
      Map<String, dynamic> data = jsonDecode(response);
      SurahModel surahModel = SurahModel.fromJson(data);

      allSurah.add(surahModel);
    }
    return allSurah;
  }
}
