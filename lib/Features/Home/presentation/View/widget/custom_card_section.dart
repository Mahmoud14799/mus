import 'package:flutter/material.dart';
import 'package:muslim/core/utils/constantes.dart';

class CustomCardSection extends StatelessWidget {
  const CustomCardSection(
      {super.key,
      required this.title,
      required this.image,
      required this.screen});
  final String title;
  final String image;
  final Widget screen;
  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return screen;
          }));
        },
        child: Container(
          margin: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
          child: GridTile(
            footer: Container(
              decoration: BoxDecoration(
                  color: const Color(0xffdbb859).withOpacity(.7),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  )),
              alignment: Alignment.center,
              width: double.infinity,
              height: 30,
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'title',
                    fontSize: 15,
                    color: kColorPrimary,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                color: Colors.black38.withOpacity(.05),
              ),
              child: Image.asset(
                scale: .5,
                image,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
