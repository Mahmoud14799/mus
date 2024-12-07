import 'package:flutter/material.dart';
import 'package:muslim/core/utils/constantes.dart';
import 'package:quran/quran.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    required this.e,
    // required this.jsonData,
  }) : super(key: key);
  final e;
  // final jsonData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/images/888-02.png",
              width: MediaQuery.of(context).size.width,
              height: 50,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .05,
                vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "اياتها\n${getVerseCount(e["surah"])}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 8,
                      fontFamily: "UthmanicHafs13",
                      color: Colors.white70),
                ),
                Center(
                    child: RichText(
                        text: TextSpan(
                  text: e["surah"].toString(),

                  // textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: "arsura",
                      fontSize: 30,
                      color: kColorTertiary),
                ))),
                Text(
                  "ترتيبها\n${e["surah"]}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 8,
                      fontFamily: "UthmanicHafs13"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
