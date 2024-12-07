import 'package:flutter/material.dart';
import 'package:muslim/Features/hadith/data/model/hadith_model.dart';
import 'package:muslim/core/utils/constantes.dart';

class ItemHadithPage extends StatelessWidget {
  const ItemHadithPage(
      {super.key, required this.hadithModel, required this.countHadith});
  final HadithModel hadithModel;
  final int countHadith;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kColorSecondary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(countHadith.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                IconButton(
                  icon: const Icon(Icons.share),
                  color: Colors.brown.shade900,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.copy),
                  color: Colors.brown.shade900,
                  onPressed: () {},
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white38,
                    shape: BoxShape.rectangle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    hadithModel.id.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Text.rich(
              TextSpan(
                text: hadithModel.hadith,
              ),
              textAlign: TextAlign.right,
              style:
                  const TextStyle(fontSize: 16, height: 1.5, fontFamily: 'Qk'),
            ),
          ),
        ],
      ),
    );
  }
}
