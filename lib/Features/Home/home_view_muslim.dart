import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim/Features/Home/data/model/card_data_model.dart';
import 'package:muslim/Features/Home/presentation/View/widget/custom_card_section.dart';
import 'package:muslim/Features/Home/presentation/View/widget/custom_card_widget.dart';
import 'package:muslim/Features/Home/presentation/View/widget/date_widget.dart';
import 'package:muslim/Features/Home/presentation/View/widget/dot_switch.dart';
import 'package:muslim/Features/elquran/presentation/Views/quran_surah_page.dart';
import 'package:muslim/Features/prayer_times/presentation/manger/cubit/prayer_times_cubit.dart';
import 'package:muslim/Features/prayer_times/presentation/prayer_time_widget.dart';
import 'package:muslim/core/utils/constantes.dart';
import 'package:muslim/core/utils/load_json_asset.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewMuslim extends StatefulWidget {
  const HomeViewMuslim({super.key});

  @override
  State<HomeViewMuslim> createState() => _HomeViewMuslimState();
}

class _HomeViewMuslimState extends State<HomeViewMuslim> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  var lastReadPage;
  String? surahName;
  String? lastSurahName;
  List<dynamic>? widgetJsonData;
  final QuranService quranService = QuranService();

  @override
  void initState() {
    super.initState();
    loadSurahs();
    loadLastReadPage();
    // precacheImage(const AssetImage("assets/images/card.webp"), context);
  }

  Future<void> loadSurahs() async {
    final data = await quranService.loadSurahsJson();
    setState(() {
      widgetJsonData = data;
    });
  }

  Future<void> loadLastReadPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      lastReadPage = prefs.getInt('lastReadPage');
      lastSurahName = prefs.getString('surahName');
    });
  }

  Future<void> saveLastReadPage(int page) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastReadPage', page);
  }

  Future<void> saveLastReadPageName(String NameSurah) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('surahName', NameSurah);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: kColorPrimary,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 30, // السماح للنص بأخذ كل العرض المتاح
                child: FittedBox(
                  fit: BoxFit.contain, // ضبط النص ليتناسب مع المساحة
                  alignment: Alignment.center, // محاذاة النص في المركز
                  child: Text(
                    'K',
                    style: TextStyle(
                        fontSize: 40.sp,
                        fontFamily: 'islamic',
                        color: const Color(0xffd3b358)),
                  ),
                ),
              ),
              dateSection(),
              SizedBox(
                height: 200.h,
                child: PageView(
                  reverse: true,
                  controller: _pageController,
                  onPageChanged: (value) => setState(() => currentPage = value),
                  scrollDirection: Axis.horizontal,
                  children: [
                    evintCard(
                      surahName: surahName ?? lastSurahName,
                      context: context,
                      jsonData: widgetJsonData,
                      lastReadPage: lastReadPage,
                      lastSurahName: lastSurahName,
                      onNavigateToQuran: (page) async {
                        await saveLastReadPage(page);
                        await saveLastReadPageName(
                            lastSurahName!); // حفظ آخر صفحة
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuranSurahPage(
                              lastPage: page,
                              jsonData: widgetJsonData,
                              surahName: surahName,
                              lastPageName: lastSurahName,
                            ),
                          ),
                        ).then((_) => loadLastReadPage());
                      },
                    ),
                    evintCard(),
                    evintCard(),
                    evintCard()
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              DotSwitch(
                totalPages: 4,
                currentPage: currentPage,
              ),
              const SizedBox(height: 20),
              BlocProvider(
                create: (context) => PrayerTimesCubit(),
                child: const PrayerTimeWidget(),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  itemCount: 4, // عدد الكروت
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: .5.h,
                    crossAxisSpacing: .5 / .60,
                    childAspectRatio: 2 / 1.7,
                  ),
                  itemBuilder: (context, index) {
                    final card = CardData[index];
                    return CustomCardSection(
                      screen: card.screen,
                      image: card.image,
                      title: card.title,
                    ); // بناء الكارتات ديناميكيًا
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
