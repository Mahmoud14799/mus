import 'package:adhan/adhan.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim/Features/prayer_times/model/prayer_times_model.dart';
import 'prayer_times_state.dart';

class PrayerTimesCubit extends Cubit<PrayerTimesState> {
  PrayerTimesCubit() : super(PrayerTimesInitial());

  late PrayerTimesModel prayerTimer;
  Future<void> fetchPrayerTimesGps() async {
    try {
      // طلب الإذن للوصول إلى الموقع
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        // إذا تم رفض الإذن، استخدم الأوقات الافتراضية
      }

      // إذا تم منح الإذن، احصل على الموقع
      Position position = await Geolocator.getCurrentPosition(
        locationSettings:
            const LocationSettings(accuracy: LocationAccuracy.high),
      );

      // إعداد الإحداثيات وحساب مواقيت الصلاة
      final coordinates = Coordinates(position.latitude, position.longitude);
      final params = CalculationMethod.egyptian.getParameters();
      params.madhab = Madhab.shafi;

      final prayerTimes = PrayerTimes.today(coordinates, params);

      final prayerTimesModel = PrayerTimesModel(
        fajr: _formatTime(prayerTimes.fajr),
        dhuhr: _formatTime(prayerTimes.dhuhr),
        asr: _formatTime(prayerTimes.asr),
        maghrib: _formatTime(prayerTimes.maghrib),
        isha: _formatTime(prayerTimes.isha),
      );

      emit(PrayerTimesLoaded(prayerTimesModel)); // تحميل أوقات الصلاة
    } catch (e) {
      print(e);
      // في حالة حدوث خطأ غير متوقع، استخدم الأوقات الافتراضية
    }
  }

  Future<void> fetchPrayerTimes() async {
    final coordinates = Coordinates(30.033333, 31.233334); // موقع الأقصر
    final params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.shafi;

    final prayerTimes =
        PrayerTimes(coordinates, DateComponents.from(DateTime.now()), params);

    final prayerTimesModel = PrayerTimesModel(
      fajr: _formatTime(prayerTimes.fajr),
      dhuhr: _formatTime(prayerTimes.dhuhr),
      asr: _formatTime(prayerTimes.asr),
      maghrib: _formatTime(prayerTimes.maghrib),
      isha: _formatTime(prayerTimes.isha),
    );

    emit(PrayerTimesError(prayerTimesModel)); // عرض الأوقات الافتراضية
  }

  String _formatTime(DateTime time) {
    return "${(time.hour >= 12) ? 'م' : 'ص'} ${time.hour % 12 == 0 ? 12 : time.hour % 12}:${time.minute.toString().padLeft(2, '0')} ";
  }
}
