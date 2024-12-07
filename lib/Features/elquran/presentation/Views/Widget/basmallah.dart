import 'package:flutter/material.dart';

class Basmallah extends StatefulWidget {
  final int index;
  const Basmallah({Key? key, required this.index}) : super(key: key);

  @override
  State<Basmallah> createState() => _BasmallahState();
}

class _BasmallahState extends State<Basmallah> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width,
      child: Padding(
        padding: EdgeInsets.only(
          left: (screenSize.width * .2),
          right: (screenSize.width * .2),
        ),
        child: Image.asset(
          "assets/images/Basmala.png",
          color: Colors.white70,
          width: MediaQuery.of(context).size.width * .4,
        ),
      ),
    );
  }
}
