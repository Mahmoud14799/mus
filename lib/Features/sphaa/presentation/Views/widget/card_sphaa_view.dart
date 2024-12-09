import 'package:flutter/material.dart';
import 'package:muslim/Features/sphaa/data/sphaa_model.dart';
import 'package:muslim/Features/sphaa/presentation/Views/sphaa_page.dart';

class cardSphaa extends StatelessWidget {
  const cardSphaa({
    super.key,
    this.onTap,
    required this.sphaaModel,
  });
  final void Function()? onTap;
  final SphaaModel sphaaModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SPhaaPage(
          sphaaModel: sphaaModel,
        );
      })),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        color: const Color(0xff152625),
        elevation: 2,
        child: SizedBox(
          height: 120, // طول الكارد
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  sphaaModel.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'title',
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.back_hand_outlined, color: Colors.white),
                    Text(
                      'عدد الحبات : 33',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'title',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
