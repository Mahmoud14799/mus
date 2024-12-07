import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:muslim/Features/hadith/data/model/hadith_model.dart';
import 'package:muslim/Features/hadith/data/web_service/hadith_web_service.dart';

part 'hadith_state.dart';

class HadithCubit extends Cubit<HadithState> {
  final HadithWebService _webService;
  HadithCubit(this._webService) : super(HadithInitial());

  Future<void> getHadith(String hadithName) async {
    emit(HadithLoading());
    try {
      final result = await _webService.loadHadith(hadithName);

      final List<HadithModel> hadith = result['hadith'];
      final int hadithCount = result['countHadith'];
      emit(HadithSuccess(hadith, hadithCount));
    } catch (e) {
      emit(HadithError(e.toString()));
    }
  }
}
