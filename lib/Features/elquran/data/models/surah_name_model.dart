class SurahNameModel {
  final String typeSurah;
  final int ayahCount;
  final String nameSurah;
  final int surahNumber;

  SurahNameModel({
    required this.typeSurah,
    required this.ayahCount,
    required this.nameSurah,
    required this.surahNumber,
  });

  factory SurahNameModel.fromJson(Map<String, dynamic> json) {
    return SurahNameModel(
      typeSurah: json['revelationType'],
      ayahCount: json['numberOfAyahs'],
      nameSurah: json['name'],
      surahNumber: json['number'],
    );
  }
}
