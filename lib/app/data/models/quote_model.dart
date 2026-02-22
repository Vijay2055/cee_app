class QuoteModel {
  final String id;
  final String text;
  final String author;

  QuoteModel({required this.id, required this.text, required this.author});

  factory QuoteModel.fromJson(Map<String, dynamic> map, {required String id}) {
    return QuoteModel(id: id, text: map['text'], author: map['author']);
  }
}
