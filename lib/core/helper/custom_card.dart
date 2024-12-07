import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.imageText,
    required this.bgColor,
  });

  final String imageText;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: bgColor,
      elevation: 02,
      child: Image.asset(
        alignment: Alignment.bottomCenter,
        fit: BoxFit.contain,
        'assets/images/Mosque-02.png',
      ),
    );
  }
}

// class InwardCurveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.moveTo(0, 0);

//     // رسم الخط العمودي للأسفل إلى الحافة السفلية اليسرى
//     path.lineTo(0, size.height - 20);

//     // رسم منحنى للداخل (التقوس نحو الأعلى)
//     path.quadraticBezierTo(
//         size.width / 2, size.height - 50, size.width, size.height - 20);

//     // رسم الخط العمودي إلى الزاوية العلوية اليمنى
//     path.lineTo(size.width, 0);

//     // إغلاق المسار
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }
