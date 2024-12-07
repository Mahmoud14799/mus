// import 'package:get_it/get_it.dart';
// import 'package:muslim/Features/prayer_times/data/prayer_times_remote_data_source.dart';
// import 'package:muslim/Features/prayer_times/domin/prayer_times_usecase.dart';
// import 'package:muslim/Features/prayer_times/presentation/manger/cubit/prayer_times_cubit.dart';

// final GetIt getIt = GetIt.instance;

// void setup() {
//   // تهيئة الاعتماديات
//   final remoteDataSource = PrayerTimesRemoteDataSource();
//   final repository = PrayerTimesRepositoryImpl(remoteDataSource);
//   final getPrayerTimesUseCase = GetPrayerTimesUseCase(repository);
//   final prayerTimesCubit = PrayerTimesCubit(getPrayerTimesUseCase);

//   // تسجيل الاعتماديات في GetIt
//   getIt.registerSingleton<PrayerTimesCubit>(prayerTimesCubit);
//   getIt.registerSingleton<GetPrayerTimesUseCase>(getPrayerTimesUseCase);
//   getIt.registerSingleton<PrayerTimesRepositoryImpl>(repository);
//   getIt.registerSingleton<PrayerTimesRemoteDataSource>(remoteDataSource);
// }
