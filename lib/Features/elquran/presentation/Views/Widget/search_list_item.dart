import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslim/core/helper/convart_to_arabic_number.dart';
import 'package:muslim/core/utils/constantes.dart';
import 'package:quran/quran.dart';
import 'package:share_plus/share_plus.dart';

class SearchListItem extends StatelessWidget {
  const SearchListItem({
    super.key,
    this.resultSearch,
  });
  final dynamic resultSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 1),
        decoration: BoxDecoration(
          color: const Color(0xff1c302f),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xff1c302f), width: 1),
          boxShadow: [
            BoxShadow(
                spreadRadius: -1,
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(0, -4),
                blurRadius: 1,
                blurStyle: BlurStyle.solid),
            BoxShadow(
              spreadRadius: -1,
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    RichText(
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      text: TextSpan(
                        text: " ${resultSearch['surah'].toString()}",
                        style: const TextStyle(
                          fontFamily: "arsura",
                          fontSize: 30,
                          color: kColorTextYalow,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      " أيه رقم  :  ${resultSearch['verse'].toString().toArabicNumbers} ",
                      style: const TextStyle(
                          fontFamily: 'title',
                          fontSize: 15,
                          color: kColorTextYalow),
                    ),
                  ],
                ),
                const Divider(
                  color: kColorPrimary2,
                  thickness: 1,
                ),
                const SizedBox(height: 8),
                RichText(
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  text: TextSpan(
                    text: getVerseQCF(
                            resultSearch["surah"], resultSearch['verse'])
                        .toString(),
                    style: TextStyle(
                      fontFamily:
                          "QCF_P${getPageNumber(resultSearch["surah"], resultSearch['verse']).toString().padLeft(3, '0')}",
                      fontSize: 18,
                      color: kColorSecondary,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(
                  color: kColorPrimary2,
                  thickness: 1,
                ),
                SizedBox(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(text: resultSearch['content']),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('تم نسخ الذكر إلى الحافظة'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        icon: const Icon(
                          size: 20,
                          Icons.copy,
                          color: Colors.white70,
                        ),
                        tooltip: 'نسخ النص',
                      ),
                      IconButton(
                        onPressed: () {
                          Share.share(resultSearch['content']);
                        },
                        icon: const Icon(
                          size: 20,
                          Icons.share,
                          color: Colors.white70,
                        ),
                        tooltip: 'مشاركة النص',
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
