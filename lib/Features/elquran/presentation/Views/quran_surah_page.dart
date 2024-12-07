// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim/Features/elquran/presentation/Views/Widget/basmallah.dart';
import 'package:muslim/Features/elquran/presentation/Views/Widget/header_widget.dart';
import 'package:muslim/core/utils/constantes.dart';
import 'package:muslim/core/utils/surah_name_list.dart';
import 'package:quran/quran.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranSurahPage extends StatefulWidget {
  final pageNumber;
  final jsonData;
  final lastPage;
  final surahName;
  final lastPageName;

  const QuranSurahPage({
    super.key,
    this.lastPage,
    this.pageNumber,
    required this.jsonData,
    this.surahName,
    this.lastPageName,
  });

  @override
  State<QuranSurahPage> createState() => _QuranSurahPageState();
}

class _QuranSurahPageState extends State<QuranSurahPage> {
  List<GlobalKey> richTextKeys = List.generate(
    604, // Replace with the number of pages in your PageView
    (_) => GlobalKey(),
  );

  setIndex() {
    setState(() {
      index = widget.pageNumber ?? widget.lastPage;
      name = widget.surahName ?? widget.lastPageName;
    });
  }

  PageController? _pageController;
  int index = 0;
  String name = '';

  @override
  void initState() {
    super.initState();
    setIndex();
    _pageController = PageController(initialPage: index);
    loadLastReadPage();

    saveLastReadPage(index);

    saveLastNameSurah(name);
    loadLastReadPageName();
  }

  Future<void> loadLastReadPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int savedPage = prefs.getInt('lastReadPage') ??
        widget.pageNumber ??
        widget.lastPage ??
        0;

    setState(() {
      index = savedPage;
      _pageController = PageController(initialPage: index);
    });
  }

  Future<void> loadLastReadPageName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedPageName = prefs.getString('surahName') ??
        widget.surahName ??
        widget.lastPageName ??
        'لا توجد';

    setState(() {
      name = savedPageName;
    });
  }

  Future<void> saveLastReadPage(
    int page,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastReadPage', page);
  }

  Future<void> saveLastNameSurah(
    String nameSurah,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('surahName', nameSurah);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView.builder(
        padEnds: false,
        reverse: true,
        scrollDirection: Axis.horizontal,
        onPageChanged: (value) async {
          setState(() {
            index = value;
            saveLastReadPage(value);
            saveLastNameSurah(sortedList[getPageData(index)[0]["surah"] - 1]);
          });
        },
        controller: _pageController,
        itemCount: totalPagesCount + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              color: const Color(0xffFFFCE7),
              child: Image.asset(
                "assets/images/Basmala.png",
                fit: BoxFit.fitWidth,
              ),
            );
          }
          return Container(
            // padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            // height: screenSize.height * .5,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: kColorPrimary,
              body: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.only(
                  right: 11.0,
                  left: 11,
                ),
                child: Column(
                  children: [
                    appBar(screenSize, context, index, sortedList),
                    if ((index == 1 || index == 2))
                      SizedBox(
                        height: (screenSize.height * .15),
                      ),
                    Expanded(
                      child: Directionality(
                        textDirection: m.TextDirection.rtl,
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: RichText(
                              key: richTextKeys[index - 1],
                              textDirection: m.TextDirection.rtl,
                              textAlign:
                                  (index == 1 || index == 2 || index == 570)
                                      ? TextAlign.center
                                      : TextAlign.center,
                              softWrap: true,
                              locale: const Locale('ar'),
                              text: TextSpan(
                                  style: TextStyle(
                                    color: m.Colors.white,
                                    fontSize: 23.sp.toDouble(),
                                  ),
                                  children: getPageData(index).expand((e) {
                                    List<InlineSpan> spans = [];
                                    for (var i = e['start'];
                                        i <= e["end"];
                                        i++) {
                                      // Header
                                      if (i == 1) {
                                        spans.add(WidgetSpan(
                                          child: HeaderWidget(
                                            e: e,
                                          ),
                                        ));
                                        if (index == 1 && i == 1) {
                                          spans.add(WidgetSpan(
                                              child: Container(
                                            width: 50,
                                          )));
                                          spans.add(TextSpan(
                                              text: getVerseQCF(e["surah"], i),
                                              style: const TextStyle(
                                                  fontFamily: "QCF_P001")));
                                          spans.add(WidgetSpan(
                                              child: Container(
                                            width: 30,
                                          )));
                                          continue;
                                        }
                                        if (index != 187 && index != 1) {
                                          spans.add(const WidgetSpan(
                                            child: Basmallah(index: 0),
                                          ));
                                        }
                                        if (index == 187) {
                                          spans.add(WidgetSpan(
                                            child: Container(
                                              height: 5.h,
                                            ),
                                          ));
                                        }
                                      }

                                      spans.add(TextSpan(
                                        text: i == e['start']
                                            ? "${getVerseQCF(e["surah"], i).replaceAll(" ", "").substring(0, 1)}\u200A${getVerseQCF(e["surah"], i).replaceAll(" ", "").substring(1)}"
                                            : getVerseQCF(e["surah"], i)
                                                .replaceAll(' ', ''),
                                        style: TextStyle(
                                          color: Colors.white70,
                                          height: (index == 1 || index == 2)
                                              ? 1.30.h
                                              : 1.8.h,
                                          letterSpacing: 0,
                                          wordSpacing: 0,
                                          fontFamily:
                                              "QCF_P${index.toString().padLeft(3, "0")}",
                                          fontSize: index == 1 || index == 2
                                              ? 33.sp
                                              : index == 145 || index == 201
                                                  ? index == 532 || index == 533
                                                      ? 22.5.sp
                                                      : 23.4.sp
                                                  : 23.1.sp,
                                          backgroundColor: Colors.transparent,
                                        ),
                                      ));
                                    }
                                    return spans;
                                  }).toList()),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
            ),
          );
        },
      ),
    );
  }

  SizedBox appBar(
      Size screenSize, BuildContext context, int index, List<String> listName) {
    return SizedBox(
      width: screenSize.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: (screenSize.width * .27),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                  color: Colors.white,
                ),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      listName[getPageData(index)[0]["surah"] - 1],
                      style: const TextStyle(
                          fontSize: 40,
                          fontFamily: 'Qk',
                          color: Color(0xffdbb859)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 20,
            width: 120,
            decoration: BoxDecoration(
                color: Colors.orange[700],
                borderRadius: const BorderRadius.all(Radius.circular(16))),
            child: Center(
              child: Text(
                "${"page"} $index ",
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'aldahabi',
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            width: (screenSize.width * .27),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      color: Colors.white,
                      Icons.settings,
                      size: 24,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
