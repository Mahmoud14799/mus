import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim/core/helper/router.dart';
import 'package:muslim/home_page.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent, // شريط الحالة شفاف
  //     statusBarIconBrightness:
  //         Brightness.light, // لون أيقونات شريط الحالة إلى الأبيض
  //     statusBarBrightness: Brightness.dark, // للـ iOS
  //   ),
  // );
  runApp(Muslim(appRouter: AppRouter()));
}

class Muslim extends StatelessWidget {
  const Muslim({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72727272727275, 800.7272727272727),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        showPerformanceOverlay: false,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.onGenerateRoute,
        title: 'Muslim',
        home: const HomePage(),
      ),
    );
  }
}
