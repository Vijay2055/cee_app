class QuoteModel {
  final String text;
  final String author;
  final int randIndex;
  final DateTime createdAt;

  QuoteModel({
    required this.author,
    required this.text,

    required this.randIndex,
    required this.createdAt,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      text: json['text'],
      randIndex: json['randomIndex'],
      createdAt: json['createdAt'],
      author: json['author'],
    );
  }
}
