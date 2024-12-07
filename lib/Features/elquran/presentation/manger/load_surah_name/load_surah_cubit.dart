import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:muslim/Features/elquran/data/models/surah_name_model.dart';
import 'package:muslim/Features/elquran/data/repositories/surah_name_repository.dart';

part 'load_surah_state.dart';

class LoadSurahCubit extends Cubit<LoadSurahState> {
  final SurahNameRepository surahNameRepository;
  List<SurahNameModel> surahNameList = [];
  LoadSurahCubit(this.surahNameRepository) : super(LoadSurahInitial());

  List<SurahNameModel> loadSurahName() {
    surahNameRepository.getSurahName().then((surahName) {
      emit(LoadSurahSuccess(surahName));
      surahNameList = surahName;
    });

    return surahNameList;
  }
}
