import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslim/Features/azkar/presentation/Views/Widget/azkar_list_item.dart';
import 'package:muslim/Features/azkar/presentation/Views/azkar_page.dart';
import 'package:muslim/core/helper/custom_card.dart';
import 'package:muslim/core/utils/constantes.dart';

class AzkarNestedScrollView extends StatefulWidget {
  final Widget? listItem;
  const AzkarNestedScrollView({super.key, this.listItem});

  @override
  State<AzkarNestedScrollView> createState() => _AzkarNestedScrollViewState();
}

class _AzkarNestedScrollViewState extends State<AzkarNestedScrollView> {
  late List<dynamic> _data = []; // تهيئة _data بقائمة فارغة
  late List<dynamic> jsonData = []; // تعريف jsonData لتخزين البيانات الكاملة
  Set<String> addedCategories =
      {}; // مجموعة لتخزين الفئات التي تمت إضافتها مسبقًا
  @override
  void initState() {
    super.initState();
    // تحميل البيانات من ملف JSON
    _loadData();
  }

  Future<void> _loadData() async {
    // قراءة البيانات من الملف
    String jsonString = await rootBundle.loadString('assets/json/azkar.json');
    jsonData = json.decode(jsonString); // تخزين البيانات الكاملة في jsonData

    setState(() {
      _data = []; // إعادة تهيئة _data لتكون فارغة
      for (var item in jsonData) {
        String category = item['category'];

        // تحقق إذا كانت الفئة قد أضيفت مسبقًا
        if (!addedCategories.contains(category)) {
          addedCategories.add(category); // إضافة الفئة إلى المجموعة
          _data.add(item); // إضافة العنصر للقائمة
        }
      }
    });
  }

  Widget loadingList() {
    return const CircularProgressIndicator(
      color: Colors.teal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff14453c),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: false, // لا يتم تثبيت الشريط عند التمرير
            floating: true, // يظهر الشريط عند التمرير للأعلى
            backgroundColor: Color(0xff14453c),
            expandedHeight: 170,

            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                child: CustomCard(
                  imageText: '*',
                  bgColor: kColorPrimary,
                ),
              ),
            ),
          ),
        ],
        body: _data.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                  decoration: const BoxDecoration(
                    color: kColorPrimary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: RawScrollbar(
                      thumbColor: Colors.teal,
                      scrollbarOrientation: ScrollbarOrientation.left,
                      thumbVisibility: false,
                      thickness: 5,
                      radius: const Radius.circular(20),
                      interactive: true,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: _data.length,
                        itemBuilder: (context, index) {
                          final category = _data[index]['category'];
                          return Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 15,
                                    spreadRadius: 3,
                                  ),
                                ],
                              ),
                              child: AzkarListItem(
                                  index: index + 1,
                                  azkarName: category,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AzkarPage(
                                          zekrTitle: category,
                                          data:
                                              jsonData // إرسال البيانات الكاملة إلى الصفحة الثانية
                                                  .where((e) =>
                                                      e['category'] == category)
                                                  .toList(),
                                        ),
                                      ),
                                    );
                                  }));
                        },
                      ),
                    ),
                  ),
                ),
              )
            : Center(child: loadingList()),
      ),
    );
  }
}
