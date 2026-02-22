class PdfModel {
  final String title;
  final String pdfUrl;
  final String subtitle;

  PdfModel({
    required this.title,
    required this.pdfUrl,
    required this.subtitle,
  });

  factory PdfModel.fromMap(Map<String, dynamic> map) {
    return PdfModel(
      title: map['title'] ?? '',
      pdfUrl: map['pdfUrl'] ?? '',
      subtitle: map['subtitle'] ?? '',
    );
  }
}
