import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/Features/elquran/data/models/surah_model.dart';
import 'package:muslim/Features/elquran/presentation/Views/Widget/surah_list_item.dart';
import 'package:muslim/Features/elquran/presentation/manger/load_surah_name/load_surah_cubit.dart';
import 'package:muslim/core/helper/custom_card.dart';
import 'package:muslim/core/utils/constantes.dart';
import 'package:muslim/core/utils/load_json_asset.dart';
import 'package:muslim/core/utils/surah_name_list.dart';
import 'package:quran/quran.dart';

class QuranViewBody extends StatefulWidget {
  const QuranViewBody({super.key});

  @override
  State<QuranViewBody> createState() => _QuranViewBodyState();
}

class _QuranViewBodyState extends State<QuranViewBody> {
  var widgejsonData;
  final QuranService quranService = QuranService();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<LoadSurahCubit>(context).loadSurahName();
    loadSurahs();
  }

  Future<void> loadSurahs() async {
    final data = await quranService.loadSurahsJson();
    setState(() {
      widgejsonData = data;
    });
  }

  Widget loadingList() {
    return const CircularProgressIndicator(
      color: Colors.teal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorPrimary,
      appBar: appBar(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: false, // لا يتم تثبيت الشريط عند التمرير
            floating: true, // يظهر الشريط عند التمرير للأعلى
            backgroundColor: kColorPrimary,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              background: CustomCard(
                imageText: '*',
                bgColor: kColorPrimary,
              ),
            ),
          ),
        ],
        body: widgejsonData != null
            ? Padding(
                padding: const EdgeInsets.only(left: 5),
                child: RawScrollbar(
                  thumbColor: Colors.teal,
                  scrollbarOrientation: ScrollbarOrientation.left,
                  thumbVisibility: false,
                  thickness: 5,
                  radius: const Radius.circular(20),
                  interactive: true,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: widgejsonData?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 15,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                        child: SurahListItem(
                          placeOfRevelation: getPlaceOfRevelation(
                              widgejsonData[index]['number']),
                          surahName: sortedList[index],
                          surahNumber: widgejsonData[index]['number'],
                          surahModel: SurahModel.empty(),
                          jsonSuraData: widgejsonData,
                        ),
                      );
                    },
                  ),
                ),
              )
            : Center(child: loadingList()),
      ),
    );
  }
}

AppBar appBar() {
  return AppBar(
    toolbarHeight: 60,
    forceMaterialTransparency: true,
    backgroundColor: const Color(0xffb0d3cb),
    centerTitle: true,
    title: const Text(
      'القران الكريم',
      style: TextStyle(
        fontFamily: 'AppBarTitle',
        fontSize: 20,
        color: kColorSecondary,
      ),
    ),
  );
}
