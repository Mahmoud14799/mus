import 'package:flutter/material.dart';
import 'package:muslim/Features/azkar/presentation/Views/Widget/azkar_page_body.dart';

class AzkarPage extends StatelessWidget {
  const AzkarPage({super.key, required this.zekrTitle, required this.data});
  final String zekrTitle;
  final List<dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff14453c),
      appBar: AppBar(
          backgroundColor: const Color(0xff14453c),
          centerTitle: true,
          title: Text(zekrTitle,
              style: const TextStyle(
                fontFamily: 'title',
                fontSize: 20,
                color: Colors.white,
              )),
          elevation: 0,
          forceMaterialTransparency: true),
      body: AzkarPageBody(data: data),
    );
  }
}
