import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:muslim/core/helper/convart_to_arabic_number.dart';

class AzkarPageBody extends StatefulWidget {
  final List<dynamic> data;
  const AzkarPageBody({super.key, required this.data});

  @override
  State<AzkarPageBody> createState() => _AzkarPageBodyState();
}

class _AzkarPageBodyState extends State<AzkarPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff1c302f),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          final zekr = widget.data[index];
          final backgroundColor = index % 2 == 0
              ? const Color(0xFF152726)
              : const Color(0xFF152726); // خلفيات متناوبة
          // const borderColor = Color(0xFFDBB859);
          // ألوان الحدود

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: backgroundColor,
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
                  Text(
                    zekr['zekr'],
                    style: const TextStyle(
                        fontFamily: 'title',
                        fontSize: 16,
                        color: Colors.white70,
                        height: 1.7,
                        wordSpacing: 5),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff1c302f),
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: const Color(0xff1c302f), width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        zekr['description'].isEmpty
                            ? 'بدون وصف'
                            : zekr['description'],
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white60,
                            fontFamily: 'title'),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Divider(
                    color: Color(0xff1c302f),
                    thickness: 1.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Clipboard.setData(
                                ClipboardData(text: zekr['zekr']),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('تم نسخ الذكر إلى الحافظة'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.copy,
                              color: Colors.white70,
                            ),
                            tooltip: 'نسخ النص',
                          ),
                          IconButton(
                            onPressed: () {
                              Share.share(zekr['zekr']);
                            },
                            icon: const Icon(
                              Icons.share,
                              color: Colors.white70,
                            ),
                            tooltip: 'مشاركة النص',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xff1c302f),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  zekr['count'].isEmpty
                                      ? 'مره'
                                      : " ${zekr['count'].toString().toArabicNumbers}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Icon(
                                  Icons.repeat,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          zekr['count'].isEmpty
                              ? const SizedBox()
                              : Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff1c302f),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    " ${zekr['reference'].toString().toArabicNumbers}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                        ].reversed.toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
