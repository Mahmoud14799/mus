// import 'package:flutter/material.dart';
// import 'package:muslim/Features/elquran/data/models/surah_model.dart';
// import 'package:muslim/Features/elquran/data/models/surah_name_model.dart';
// import 'package:muslim/Features/elquran/presentation/Views/Widget/surah_list_item.dart';

// class SurahList extends StatelessWidget {
//   final List<SurahNameModel> surahNames;
//   final dynamic jsonSuraData;

//   const SurahList({
//     super.key,
//     required this.surahNames,
//     required this.jsonSuraData,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       physics: const BouncingScrollPhysics(),
//       scrollDirection: Axis.vertical,
//       padding: const EdgeInsets.all(8.0),
//       itemCount: surahNames.length,
//       itemBuilder: (context, index) {
//         return SurahListItem(
//           surahName: jsonSuraData[index]['name'],
//           surahNumber: jsonSuraData[index]['number'],
//           jsonSuraData: jsonSuraData,
//           surahModel: SurahModel.empty(),
//         );
//       },
//     );
//   }
// }
