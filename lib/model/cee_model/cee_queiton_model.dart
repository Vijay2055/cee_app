class CeeQuestionModel {
  String question;
  List<String> options;
  int answer;
  String explanation;

  CeeQuestionModel({
    required this.answer,
    required this.explanation,
    required this.options,
    required this.question,
  });

  factory CeeQuestionModel.fromMap(Map<String, dynamic> data) {
    return CeeQuestionModel(
      answer: data['answer'],
      explanation: data['explanation'],
      options: List<String>.from(data['options']),
      question: data['question'],
    );
  }
}

final dummyMcqList = [
  CeeQuestionModel(
    question: "Which is the biggest river of Nepal?",
    options: ["Koshi", "Karnali", "Gandaki", "Bagmati"],
    answer: 0,
    explanation: "Koshi is the largest river of Nepal.",
  ),
  CeeQuestionModel(
    question: "What is the capital city of Nepal?",
    options: ["Pokhara", "Kathmandu", "Biratnagar", "Lalitpur"],
    answer: 1,
    explanation: "Kathmandu is the capital city of Nepal.",
  ),
  CeeQuestionModel(
    question: "Which is the highest mountain in the world?",
    options: ["K2", "Everest", "Kanchenjunga", "Makalu"],
    answer: 1,
    explanation: "Mount Everest is the highest mountain in the world.",
  ),
  CeeQuestionModel(
    question: "Which currency is used in Nepal?",
    options: ["Rupee", "Dollar", "Yen", "Taka"],
    answer: 0,
    explanation: "Nepali Rupee (NPR) is used in Nepal.",
  ),
  CeeQuestionModel(
    question: "Who is known as the Light of Asia?",
    options: ["Mahatma Gandhi", "Buddha", "Confucius", "Jesus"],
    answer: 1,
    explanation: "Gautam Buddha is known as the Light of Asia.",
  ),
  CeeQuestionModel(
    question: "Which is the national bird of Nepal?",
    options: ["Peacock", "Lophophorus", "Eagle", "Dove"],
    answer: 1,
    explanation:
        "The Himalayan Monal (Lophophorus) is the national bird of Nepal.",
  ),
  CeeQuestionModel(
    question: "Which is the longest river of Nepal?",
    options: ["Karnali", "Koshi", "Gandaki", "Bagmati"],
    answer: 0,
    explanation: "Karnali is the longest river of Nepal.",
  ),
  CeeQuestionModel(
    question: "Which is the national flower of Nepal?",
    options: ["Sunflower", "Rhododendron", "Lotus", "Lily"],
    answer: 1,
    explanation: "Rhododendron is the national flower of Nepal.",
  ),
];
