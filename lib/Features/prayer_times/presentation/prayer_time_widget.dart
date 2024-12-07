import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:muslim/Features/prayer_times/model/prayer_times_model.dart';

import 'package:muslim/Features/prayer_times/presentation/manger/cubit/prayer_times_cubit.dart';
import 'package:muslim/Features/prayer_times/presentation/manger/cubit/prayer_times_state.dart';
import 'package:muslim/core/helper/convart_to_arabic_number.dart';

class PrayerTimeWidget extends StatefulWidget {
  const PrayerTimeWidget({super.key});

  @override
  State<PrayerTimeWidget> createState() => _PrayerTimeWidgetState();
}

class _PrayerTimeWidgetState extends State<PrayerTimeWidget> {
  // متغيرات لتخزين أوقات الصلاة
  String? fajrTime;
  String? dhuhrTime;
  String? asrTime;
  String? maghribTime;
  String? ishaTime;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PrayerTimesCubit>(context).fetchPrayerTimes();
    BlocProvider.of<PrayerTimesCubit>(context).fetchPrayerTimesGps();
    // calculatePrayerTimes();
  }

  String _formatTime(DateTime time) {
    return DateFormat(
      'hh:mm a',
    ).format(time); // صيغة 12 ساعة مع AM/PM
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
      builder: (context, state) {
        // معالجة الحالات المختلفة
        if (state is PrayerTimesLoaded) {
          PrayerTimesModel prayerTimes = state.prayerTimes;
          return Container(
            width: 400,
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                prayerTimeItem('العشاء', prayerTimes.isha.toArabicNumbers,
                    FontAwesomeIcons.moon),
                const SizedBox(width: 20),
                prayerTimeItem('المغرب', prayerTimes.maghrib.toArabicNumbers,
                    Icons.wb_twighlight),
                const SizedBox(width: 20),
                prayerTimeItem('العصر', prayerTimes.asr.toArabicNumbers,
                    Icons.wb_sunny_outlined),
                const SizedBox(width: 20),
                prayerTimeItem(
                    'الظهر', prayerTimes.dhuhr.toArabicNumbers, Icons.sunny),
                const SizedBox(width: 20),
                prayerTimeItem('الفجر', prayerTimes.fajr.toArabicNumbers,
                    Icons.sunny_snowing),
              ],
            ),
          );
        } else if (state is PrayerTimesError) {
          PrayerTimesModel prayerTimes = state.prayerTimes;
          return Container(
            width: 400,
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                prayerTimeItem(
                    'العشاء', prayerTimes.isha, FontAwesomeIcons.moon),
                const SizedBox(width: 20),
                prayerTimeItem(
                    'المغرب', prayerTimes.maghrib, Icons.wb_twighlight),
                const SizedBox(width: 20),
                prayerTimeItem(
                    'العصر', prayerTimes.asr, Icons.wb_sunny_outlined),
                const SizedBox(width: 20),
                prayerTimeItem('الظهر', prayerTimes.dhuhr, Icons.sunny),
                const SizedBox(width: 20),
                prayerTimeItem('الفجر', prayerTimes.fajr, Icons.sunny_snowing),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // عرض واجهة المستخدم مع بيانات الصلاة
      },
    );
  }
}

// مكون لعرض عنصر الصلاة
Widget prayerTimeItem(String title, String? time, IconData icon) {
  return Column(
    children: [
      Text(
        title,
        style: const TextStyle(
            fontFamily: 'Cairo', fontSize: 12, color: Colors.white),
      ),
      const SizedBox(height: 8),
      Icon(
        icon,
        color: const Color(0xffdbb859),
      ),
      const SizedBox(height: 8),
      Text(
        time ?? '---',
        style: const TextStyle(
            fontFamily: 'Cairo', fontSize: 14, color: Colors.white),
      ),
    ],
  );
}
