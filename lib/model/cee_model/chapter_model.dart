class Chapter {
  final String id;
  final String category;
  final String subcategory;
  final String chapter;
  final String title;
  final String pdfUrl;

  Chapter({
    required this.id,
    required this.category,
    required this.subcategory,
    required this.chapter,
    required this.title,
    required this.pdfUrl,
  });

  factory Chapter.fromJson(Map<String, dynamic> json, String id) {
    return Chapter(
      id: id,
      category: json['category'],
      subcategory: json['subcategory'],
      chapter: json['chapter'],
      title: json['title'],
      pdfUrl: json['pdfUrl'],
    );
  }
}

class PastYearPaper {
  final String id;
  final String year;
  final String url;

  PastYearPaper({required this.id, required this.year, required this.url});

  factory PastYearPaper.fromJson(Map<String, dynamic> map, String id) {
    return PastYearPaper(id: id, year: map['year'], url: map["url"]);
  }
}
