import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:muslim/Features/hadith/data/model/hadith_model.dart';
import 'package:muslim/core/utils/constantes.dart';

class HadithWebService {
  Future<Map<String, dynamic>> loadHadith(String hadithName) async {
    List<HadithModel> allHadith = [];

    final String response =
        await rootBundle.loadString('assets/json/hadith/$hadithName.json');
    final List<dynamic> data = json.decode(response);

    allHadith = data.map((json) => HadithModel.fromJson(json)).toList();

    hadithCount = allHadith.length;

    return {'hadith': allHadith, 'countHadith': hadithCount};
  }
}
