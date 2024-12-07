import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muslim/core/utils/constantes.dart';

Widget evintCard(
    {int? lastReadPage,
    dynamic jsonData,
    BuildContext? context,
    Function(int)? onNavigateToQuran,
    String? surahName,
    String? lastSurahName}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      InkWell(
        onTap: () {
          int page = lastReadPage ?? 1;
          onNavigateToQuran!(page);
        },
        child: Card(
          color: kColorPrimary,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 5,
          shadowColor: Colors.black.withOpacity(0.2),
          child: Container(
            width: 400,
            height: 170,
            // padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: kColorPrimary,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 10,
                  offset: const Offset(4, 0),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'q',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 100,
                          fontFamily: 'islamic',
                          color: Color(0xff008f7a),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'اخر قراءه',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.5),
                                  offset: const Offset(1, 1),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          const Icon(
                            FontAwesomeIcons.bookQuran,
                            color: Colors.white,
                            size: 24,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 70.h,
                        width: 110.w,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            lastSurahName ?? 'لا توجد قرائه',
                            style: TextStyle(
                              fontFamily: 'Qk',
                              fontSize: 150,
                              color: Colors.amber,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.5),
                                  offset: const Offset(1, 1),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        'رقم الايه: 1',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13,
                          color: Colors.white70,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(1, 1),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 50,
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
