import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/Features/Home/home_view_muslim.dart';
import 'package:muslim/Features/elquran/data/repositories/get_surah_repository.dart';
import 'package:muslim/Features/elquran/data/repositories/surah_name_repository.dart';
import 'package:muslim/Features/elquran/presentation/Views/quran_view.dart';
import 'package:muslim/Features/elquran/presentation/manger/load_surah_name/load_surah_cubit.dart';
import 'package:muslim/Features/hadith/presentation/View/hadith_page.dart';

class AppRouter {
  static const String initialRoute = "/";
  static const String quranView = 'QuranView';
  static const String surahItem = 'SurahItem';
  static const String homeViewMuslim = 'HomeViewMuslim';
  static const String hadithView = 'HadithPage';

  late SurahNameRepository surahNameRepository;
  late LoadSurahCubit loadSurahCubit;

  late AllSurahRepository allSurahRepository;

  AppRouter() {
    surahNameRepository = SurahNameRepository();
    loadSurahCubit = LoadSurahCubit(surahNameRepository);

    allSurahRepository = AllSurahRepository();
  }

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (context) => const HomeViewMuslim());
      case quranView:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => LoadSurahCubit(surahNameRepository),
                  child: const QuranView(),
                ));

      case homeViewMuslim:
        return MaterialPageRoute(builder: (context) => const HomeViewMuslim());

      case hadithView:
        final args = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => HadithPage(
                  hadithName: args.toString(),
                  hadithSource: args.toString(),
                ));
      default:
        return MaterialPageRoute(builder: (context) => const HomeViewMuslim());
    }
  }
}
