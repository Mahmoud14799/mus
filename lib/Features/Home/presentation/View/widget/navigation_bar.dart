import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muslim/core/utils/constantes.dart';

class CustomNavigationBarDemo extends StatefulWidget {
  const CustomNavigationBarDemo({
    super.key,
    required this.onItemTapped,
    required this.currentIndex,
  });
  final void Function(int) onItemTapped;
  final int currentIndex;
  @override
  _CustomNavigationBarDemoState createState() =>
      _CustomNavigationBarDemoState();
}

class _CustomNavigationBarDemoState extends State<CustomNavigationBarDemo> {
  // لتحديث العنصر المحدد

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: kColorPrimary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildNavItem(Icons.mosque, 0, 'الرئيسيه', () {
            widget.onItemTapped(0);
          }),
          _buildNavItem(FontAwesomeIcons.bookQuran, 1, 'القران', () {
            widget.onItemTapped(1);
          }),
          _buildNavItem(FontAwesomeIcons.starAndCrescent, 2, 'Notifications',
              () {
            widget.onItemTapped(2);
          }),
          _buildNavItem(Icons.person, 3, 'Profile', () {
            widget.onItemTapped(3);
          }),
        ],
      ),
    );
  }

  // بناء عنصر التنقل
  Widget _buildNavItem(
      IconData icon, int index, String label, void Function()? onTab) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onTab,
          icon: Icon(
            size: 25,
            icon,
            color: widget.currentIndex == index
                ? const Color(0xffdbb859)
                : Colors.white70,
          ),
        ),
        Text(
          label,
          style: TextStyle(
              color: widget.currentIndex == index
                  ? const Color(0xffdbb859)
                  : Colors.white70,
              fontSize: 10,
              fontFamily: 'Cairo'),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
