import 'package:muslim/Features/prayer_times/model/prayer_times_model.dart';

abstract class PrayerTimesState extends Equatable {
  List<Object?> get props => [];
}

class Equatable {}

class PrayerTimesInitial extends PrayerTimesState {}

class PrayerTimesLoading extends PrayerTimesState {}

class PrayerTimesLoaded extends PrayerTimesState {
  final PrayerTimesModel prayerTimes;

  PrayerTimesLoaded(this.prayerTimes);

  @override
  List<Object?> get props => [prayerTimes];
}

class PrayerTimesError extends PrayerTimesState {
  final PrayerTimesModel prayerTimes;

  PrayerTimesError(this.prayerTimes);

  @override
  List<Object?> get props => [prayerTimes];
}
