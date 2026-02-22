class ChapterModel {
  final String id;
  final String catgoryId;
  final String title;
  final String? pdfUrl;
  final int mcqCount;
  final int chapternum;

  ChapterModel({
    required this.id,
    required this.catgoryId,
    required this.title,
    required this.pdfUrl,
    required this.mcqCount,
    required this.chapternum,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> map) {
    return ChapterModel(
      id: map['chapterid'] ?? '',
      catgoryId: map['categoryid'] ?? '',
      title: map['title'],
      pdfUrl: map['pdfurl'],
      mcqCount: map['mcqcount'],
      chapternum: map['chapternumber'] ?? 0,
    );
  }
}
