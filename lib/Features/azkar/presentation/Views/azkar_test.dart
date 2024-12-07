import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AzkarPage extends StatefulWidget {
  const AzkarPage({super.key});

  @override
  _azkarPageState createState() => _azkarPageState();
}

class _azkarPageState extends State<AzkarPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("أذكار")),
      body: _data.isEmpty
          ? const Center(child: CircularProgressIndicator()) // عرض مؤشر تحميل
          : ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                final category = _data[index]['category'];
                return ListTile(
                  title: Text(category),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZekrListScreen(
                          category: category,
                          data:
                              jsonData // إرسال البيانات الكاملة إلى الصفحة الثانية
                                  .where((e) => e['category'] == category)
                                  .toList(),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

class ZekrListScreen extends StatelessWidget {
  final String category;
  final List<dynamic> data;

  const ZekrListScreen({super.key, required this.category, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final zekr = data[index];
          return ListTile(
            title: Text(zekr['zekr']),
            subtitle: Text(zekr['description']),
            trailing: Text("عدد: ${zekr['count']}"),
            onTap: () {
              // عرض تفاصيل الذكر
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('الذكر'),
                  content: Text(zekr['zekr']),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('إغلاق'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
