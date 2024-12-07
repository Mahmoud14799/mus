part of 'load_surah_cubit.dart';

@immutable
sealed class LoadSurahState {}

final class LoadSurahInitial extends LoadSurahState {}

final class LoadSurahSuccess extends LoadSurahState {
  final List<SurahNameModel> surahNameList;

  LoadSurahSuccess(this.surahNameList);
}

final class LoadSurahFailure extends LoadSurahState {
  final String message;

  LoadSurahFailure(this.message);
}
