import 'package:flutter/material.dart';
import 'package:muslim/Features/sphaa/data/sphaa_model.dart';
import 'package:muslim/Features/sphaa/presentation/Views/widget/card_sphaa_page.dart';

class PageViewCard extends StatefulWidget {
  const PageViewCard({super.key, this.controller});
  final PageController? controller;
  @override
  State<PageViewCard> createState() => _PageViewCardState();
}

class _PageViewCardState extends State<PageViewCard> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        reverse: true,
        controller: widget.controller,
        itemCount: sphaaList.length,
        itemBuilder: (context, index) {
          return CardSphaaPage(title: sphaaList[index].title);
        });
  }
}
