part of 'hadith_cubit.dart';

@immutable
sealed class HadithState {}

final class HadithInitial extends HadithState {}

final class HadithSuccess extends HadithState {
  final List<HadithModel> hadith;
  final int hadithCount;
  HadithSuccess(this.hadith, this.hadithCount);
}

final class HadithError extends HadithState {
  final String error;
  HadithError(this.error);
}

final class HadithLoading extends HadithState {}
