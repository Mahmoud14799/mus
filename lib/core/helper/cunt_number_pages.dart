List<List<String>> countNumberPages(
    int countVerse, Map<String, dynamic> verses) {
  // تحويل كل قيمة إلى String لضمان أن النوع هو List<String>
  List<String> versesList = verses.values.map((e) => e.toString()).toList();
  List<List<String>> pages = [];

  for (int i = 0; i < countVerse; i += 10) {
    // كل صفحة تحتوي على 10 آيات كحد أقصى أو ما يتبقى من الآيات
    pages.add(versesList.sublist(i, i + 10 > countVerse ? countVerse : i + 10));
  }

  return pages;
}
