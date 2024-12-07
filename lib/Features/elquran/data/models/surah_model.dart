class SurahModel {
  final String surahNumber;
  final String surahName;
  final Map<String, String> verses;
  final int versesCount;
  final List<Juz> juz;

  SurahModel({
    required this.surahNumber,
    required this.surahName,
    required this.verses,
    required this.versesCount,
    required this.juz,
  });

  // لتحويل JSON إلى كائن Surah
  factory SurahModel.fromJson(Map<String, dynamic> json) {
    // تحويل الآيات من JSON إلى Map في Dart
    Map<String, String> versesMap = Map<String, String>.from(json['verse']);

    // تحويل أجزاء السورة (juz) من JSON إلى List من Juz
    List<Juz> juzList =
        (json['juz'] as List).map((item) => Juz.fromJson(item)).toList();

    return SurahModel(
      surahNumber: json['index'],
      surahName: json['name'],
      verses: versesMap,
      versesCount: json['count'],
      juz: juzList,
    );
  }

  // لتحويل كائن Surah إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'index': surahNumber,
      'name': surahName,
      'verse': verses,
      'count': versesCount,
      'juz': juz.map((j) => j.toJson()).toList(),
    };
  }

  static SurahModel empty() {
    return SurahModel(
      surahNumber: '',
      surahName: '',
      verses: {},
      versesCount: 0,
      juz: [],
    );
  }

  // طريقة للتحقق مما إذا كان الكائن فارغًا
  bool get isEmpty =>
      surahNumber.isEmpty && surahName.isEmpty && versesCount == 0;
}

class Juz {
  final String index;
  final JuzVerseRange verse;

  Juz({
    required this.index,
    required this.verse,
  });

  // لتحويل JSON إلى كائن Juz
  factory Juz.fromJson(Map<String, dynamic> json) {
    return Juz(
      index: json['index'],
      verse: JuzVerseRange.fromJson(json['verse']),
    );
  }

  // لتحويل كائن Juz إلى JSON

  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'verse': verse.toJson(),
    };
  }
}

class JuzVerseRange {
  final String start;
  final String end;

  JuzVerseRange({
    required this.start,
    required this.end,
  });

  // لتحويل JSON إلى كائن JuzVerseRange
  factory JuzVerseRange.fromJson(Map<String, dynamic> json) {
    return JuzVerseRange(
      start: json['start'],
      end: json['end'],
    );
  }

  // لتحويل كائن JuzVerseRange إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'start': start,
      'end': end,
    };
  }

  // إضافة الطريقة static لإرجاع كائن فارغ
}
