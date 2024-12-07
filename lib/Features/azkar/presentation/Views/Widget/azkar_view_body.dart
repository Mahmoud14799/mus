import 'package:flutter/material.dart';
import 'package:muslim/Features/azkar/presentation/Views/Widget/azkar_nested_scroll_view.dart';

class AzkarViewBody extends StatefulWidget {
  const AzkarViewBody({super.key});

  @override
  State<AzkarViewBody> createState() => _AzkarViewBodyState();
}

class _AzkarViewBodyState extends State<AzkarViewBody> {
  @override
  Widget build(BuildContext context) {
    return const AzkarNestedScrollView();
  }
}
