class HadithModel {
  int id;
  String hadith;

  HadithModel({required this.id, required this.hadith});

  factory HadithModel.fromJson(Map<String, dynamic> json) {
    return HadithModel(
      id: json['number'],
      hadith: json['hadith'],
    );
  }
}
