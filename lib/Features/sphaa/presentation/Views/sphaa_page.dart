import 'package:flutter/material.dart';
import 'package:muslim/core/utils/constantes.dart';

class SPhaaPage extends StatelessWidget {
  const SPhaaPage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c302f),
      appBar: AppBar(
        title: const Text(
          "المسبحه",
          style: TextStyle(
            color: kColorSecondary,
            fontSize: 30,
            fontFamily: 'AppBarTitle',
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff193834),
      ),
      body: SphaaPageBody(
        title: title,
      ),
    );
  }
}

class SphaaPageBody extends StatefulWidget {
  const SphaaPageBody({super.key, required this.title});
  final String title;

  @override
  State<SphaaPageBody> createState() => _SphaaPageBodyState();
}

class _SphaaPageBodyState extends State<SphaaPageBody> {
  int currentCount = 0;
  int totalCount = 33;

  String titleFinish = '';
  void onCount() {
    setState(() {
      if (currentCount != totalCount) {
        currentCount++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: [
              CardSphaaPage(title: widget.title),
              const SizedBox(height: 16),
              countSection(currentCount, totalCount),
              const Spacer(),
              // إزالة الزر المتحرك من العمود

              buttonRestart(currentCount),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),

        // الزر المتحرك في منتصف الشاشة
        Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Center(
              child: SphaaButton(
            onTap: onCount,
          )),
        ),
      ],
    );
  }

  Row countSection(int currentCount, int totalCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'عدد الحبات\n\n ${totalCount.toString()}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'cairo',
            fontSize: 20,
          ),
        ),
        Text(
          'العدد الحالي \n\n ${currentCount.toString()}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'cairo',
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

class CardSphaaPage extends StatelessWidget {
  const CardSphaaPage({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      color: const Color(0xff152625),
      elevation: 2,
      child: SizedBox(
        height: 120, // طول الكارد
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                  size: 30,
                  Icons.arrow_circle_left_outlined,
                  color: Colors.white),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'title',
                ),
              ),
              const Icon(
                  size: 30,
                  Icons.arrow_circle_right_outlined,
                  color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

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

Widget buttonRestart(int currentCount) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 8),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff007258),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          currentCount = 0;
        },
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
