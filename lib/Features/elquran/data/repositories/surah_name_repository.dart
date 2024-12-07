import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:muslim/Features/elquran/data/models/surah_name_model.dart';
import 'package:muslim/core/utils/constantes.dart';

class SurahNameRepository {
  Future<List<SurahNameModel>> getSurahName() async {
    final String response = await rootBundle.loadString(kPathNameSurah);
    List<dynamic> data = jsonDecode(response);

    return data.map((nameSurah) => SurahNameModel.fromJson(nameSurah)).toList();
  }
}
