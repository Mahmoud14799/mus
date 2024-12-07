import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/Features/hadith/data/web_service/hadith_web_service.dart';
import 'package:muslim/Features/hadith/presentation/View/hadith_page.dart';
import 'package:muslim/Features/hadith/presentation/manger/hadith_cubit/hadith_cubit.dart';
import 'package:muslim/core/helper/convart_to_arabic_number.dart';

class ItemHadithView extends StatelessWidget {
  final String source;
  final String hadithName;
  final int hadithCount;
  const ItemHadithView({
    super.key,
    required this.source,
    required this.hadithName,
    required this.hadithCount,
  });

  @override
  Widget build(BuildContext context) {
    HadithWebService hadithWebService = HadithWebService();
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) =>
                HadithCubit(hadithWebService)..getHadith(source),
            child: HadithPage(
              hadithSource: source,
              hadithName: hadithName,
            ),
          );
        }));
      },
      child: Container(
        // جعل العنصر شفافاً تماماً
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Material(
          color: Colors.transparent, // الشفافية التامة
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                hadithName,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 18,
                  color: Colors.black, // النص سيكون واضحاً
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'عدد ${hadithCount.toString().toArabicNumbers} حديث',
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
