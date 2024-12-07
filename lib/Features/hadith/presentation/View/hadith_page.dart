import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/Features/hadith/presentation/View/widget/Item_hadith_page.dart';
import 'package:muslim/Features/hadith/presentation/manger/hadith_cubit/hadith_cubit.dart';

class HadithPage extends StatelessWidget {
  const HadithPage(
      {super.key, required this.hadithSource, required this.hadithName});
  final String hadithSource;
  final String hadithName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            hadithName,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          forceMaterialTransparency: true,
        ),
        body: BlocBuilder<HadithCubit, HadithState>(builder: (context, state) {
          if (state is HadithSuccess) {
            return ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.hadith.length,
                  itemBuilder: (context, index) {
                    return ItemHadithPage(
                      countHadith: state.hadithCount,
                      hadithModel: state.hadith[index],
                    );
                  },
                ),
              ),
            );
          } else if (state is HadithError) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        })

        // builder: (context, snapshot) {
        //   // التحقق من حالة البيانات
        //   if (snapshot.connectionState == ConnectionState.waiting) {
        //     return const Center(child: CircularProgressIndicator());
        //   } else if (snapshot.hasError) {
        //     return Center(
        //       child: Text('حدث خطأ: ${snapshot.error}'),
        //     );
        //   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        //     return const Center(
        //       child: Text('لا توجد بيانات لعرضها'),
        //     );
        //   } else {
        //     // عرض القائمة إذا كانت البيانات موجودة
        //     final hadiths = snapshot.data!;
        //     return ListView.builder(
        //       itemCount: hadiths.length,
        //       itemBuilder: (context, index) {
        //         return ItemHadithPage(
        //           hadithModel: hadiths[index],
        //         );
        //       },
        //     );
        //   }
        // },

        );
  }
}
