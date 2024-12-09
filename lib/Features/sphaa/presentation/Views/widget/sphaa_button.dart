import 'package:flutter/material.dart';
import 'package:muslim/core/utils/constantes.dart';

class SphaaButton extends StatefulWidget {
  final void Function() onTap;
  const SphaaButton({super.key, required this.onTap});

  @override
  State<SphaaButton> createState() => _SphaaButtonState();
}

class _SphaaButtonState extends State<SphaaButton> {
  double width = 250;
  double height = 250;

  // وظيفة لضبط الحجم عند الضغط
  void onButtonPressed(bool isPressed) {
    setState(() {
      width = isPressed ? 200 : 250;
      height = isPressed ? 200 : 250;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) {
        onButtonPressed(true);
      }, // عند بدء الضغط
      onTapUp: (_) {
        onButtonPressed(false);
      }, // عند رفع الضغط
      onTapCancel: () {
        onButtonPressed(false);
      }, // عند إلغاء الضغط
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300), // وقت الحركة
        curve: Curves.easeOut, // نوع الحركة
        height: height,
        width: width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xff0f4036), Colors.black],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(-5, -5),
                  ),
                ],
              ),
              child: Image.asset(
                color: kColorSecondary,
                'assets/images/sphaa_shape/Group (3).png',
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: height * 0.6, // الحجم النسبي للدائرة الداخلية
              width: width * 0.6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xff0f4036),
                    Colors.black.withOpacity(0.6),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Icon(
                size: 80,
                color: Color(0xff007258), // الكود الثابت
                Icons.touch_app_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buttonRestart(void Function() onPressed) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 8),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff007258),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'تصفير العداد',
                style: TextStyle(
                    color: Colors.white, fontSize: 20, fontFamily: 'title'),
              ),
            ),
            SizedBox(width: 16),
            Icon(
              Icons.restart_alt,
              color: Colors.white,
            ),
          ],
        )),
  );
}
