import 'package:flutter/material.dart';
import 'package:muslim/Features/elquran/presentation/Views/Widget/search_list_item.dart';
import 'package:muslim/core/utils/constantes.dart';
import 'package:quran/quran.dart';
import 'package:quran/quran_text.dart';

class SearchAyahView extends StatelessWidget {
  const SearchAyahView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff14453c),
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: const Color(0xff14453c),
        centerTitle: true,
        title: const Text(
          'البحث عن آية',
          style: TextStyle(
            fontFamily: 'AppBarTitle',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: const SearchAyahViewBody(),
    );
  }
}

class SearchAyahViewBody extends StatefulWidget {
  const SearchAyahViewBody({super.key});

  @override
  State<SearchAyahViewBody> createState() => _SearchAyahViewBodyState();
}

class _SearchAyahViewBodyState extends State<SearchAyahViewBody> {
  Map<dynamic, dynamic> searchResults = {};
  TextEditingController searchController = TextEditingController();

  Map searchWordsCostum(String words) {
    if (words.length <= 1) {
      return {"occurences": 0, "result": []};
    }

    List<Map> result = [];
    String cleanedInput = normalise(words.toLowerCase());

    for (var i in quranText) {
      String content = normalise(i['content'].toString().toLowerCase());
      if (content.contains(cleanedInput)) {
        result.add({
          "surah": i["surah_number"],
          "verse": i["verse_number"],
          "content": i["content"],
        });
      }
    }

    return {"occurences": result.length, "result": result};
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: searchController,
            onChanged: (value) {
              if (value.trim().isNotEmpty) {
                setState(() {
                  searchResults = searchWordsCostum(normalise(value));
                });
              } else {
                setState(() {
                  searchResults = {};
                });
              }
            },
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Cairo',
              fontSize: 16,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: kColorPrimary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xffdbb859),
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xffdbb859),
                  width: 2.5,
                ),
              ),
              hintText: 'اكتب الآية هنا...',
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontFamily: 'Cairo',
                fontSize: 14,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
              decoration: BoxDecoration(
                color: kColorPrimary,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  searchResults.isNotEmpty
                      ? searchResults['occurences'].toString()
                      : " عددالايات",
                  style: const TextStyle(color: Colors.white),
                ),
              )),
          if (searchResults.isNotEmpty)
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: searchResults['occurences'],
                itemBuilder: (context, index) {
                  final result = searchResults["result"][index];
                  return SearchListItem(resultSearch: result);
                },
              ),
            )
          else
            const Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 50,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "لم يتم العثور على نتائج.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
