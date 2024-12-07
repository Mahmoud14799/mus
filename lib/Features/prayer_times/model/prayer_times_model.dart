class PrayerTimesModel {
  late String fajr;
  late String dhuhr;
  late String asr;
  late String maghrib;
  late String isha;

  PrayerTimesModel({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  PrayerTimesModel.formJson(Map<String, dynamic> json) {
    fajr = json['fajr'];
    dhuhr = json['dhuhr'];
    asr = json['asr'];
    maghrib = json['maghrib'];
    isha = json['isha'];
  }
}
