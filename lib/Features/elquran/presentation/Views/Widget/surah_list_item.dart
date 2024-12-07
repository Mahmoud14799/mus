import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muslim/Features/elquran/data/models/surah_model.dart';
import 'package:muslim/Features/elquran/presentation/Views/quran_surah_page.dart';
import 'package:muslim/core/helper/convart_to_arabic_number.dart';
import 'package:quran/quran.dart';

class SurahListItem extends StatelessWidget {
  final SurahModel surahModel;
  final jsonSuraData;
  final String surahName;
  final int surahNumber;
  final String placeOfRevelation;
  const SurahListItem(
      {super.key,
      required this.surahModel,
      required this.jsonSuraData,
      required this.surahName,
      required this.surahNumber,
      required this.placeOfRevelation});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return QuranSurahPage(
              surahName: surahName,
              pageNumber: getPageNumber(surahNumber, 1),
              jsonData: jsonSuraData);
        }));
      },
      child: Container(
        height: 60,
        width: 140,
        alignment: Alignment.centerRight,
        // margin: const EdgeInsets.only(top: 30),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              placeOfRevelation == "Makkah"
                  ? FontAwesomeIcons.kaaba
                  : FontAwesomeIcons.mosque,
              size: 20,
              color: Colors.blueGrey,
            ),
            SizedBox(
              width: 100,
              child: FittedBox(
                fit: BoxFit.cover,
                child: RichText(
                  text: TextSpan(
                    text: surahName,
                    style: const TextStyle(
                      fontSize: 80,
                      fontFamily: 'Qk',
                      color: Color(0xffdbb859),
                    ),
                  ),
                ),
              ),
            ),
            // const SizedBox(
            //   width: 30,
            // ),
            Stack(alignment: Alignment.center, children: [
              Image.asset(
                scale: 12,
                'assets/images/download.webp',
                color: Colors.blueGrey,
              ),
              Text(
                surahNumber.toString().toArabicNumbers,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
