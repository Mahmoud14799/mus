import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/Features/elquran/data/repositories/surah_name_repository.dart';
import 'package:muslim/Features/elquran/presentation/Views/quran_view_body.dart';
import 'package:muslim/Features/elquran/presentation/manger/load_surah_name/load_surah_cubit.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    SurahNameRepository surahNameRepository = SurahNameRepository();
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoadSurahCubit(surahNameRepository),
        child: const QuranViewBody(),
      ),
    );
  }
}
