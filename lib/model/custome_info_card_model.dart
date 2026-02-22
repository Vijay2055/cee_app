import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class CustomInfoCardModel {
  final String id;
  final String title;
  final String subtile;
  final String category;
  final double height;
  final double width;
  final Color color;

  CustomInfoCardModel({
    required this.color,
    required this.height,
    required this.subtile,
    required this.title,
    required this.width,
    required this.category,
  }) : id = uuid.v4();
}

final customCardList = [
  CustomInfoCardModel(
    height: 0.18,
    subtile: "2000 Questions",
    title: "राष्ट्रिय सामान्य ज्ञान",
    width: 0.40,
    category: 'ngk',
    color: const Color(0xFF67ACFF),
  ),
  CustomInfoCardModel(
    height: 0.18,
    subtile: "500 Questions",
    title: "अन्तर्राष्ट्रिय सामान्य ज्ञान",
    width: 0.40,
    category: 'igk',
    color: const Color(0xFFB7A3FE),
  ),
  CustomInfoCardModel(
    height: 0.18,
    subtile: "400 Questions",
    title: "हालसालका समसामयिक घटनाक्रम (Current Affairs)",
    width: 0.40,
    category: 'ca',
    color: const Color(0xFF5BCECB),
  ),

  CustomInfoCardModel(
    height: 0.18,
    subtile: "2000 Questions",
    title: "नेपाली भाषा",
    width: 0.40,
    category: 'nl',
    color: Color(0xFF67ACFF),
  ),
  CustomInfoCardModel(
    height: 0.18,
    subtile: "500 Questions",
    title: "अङ्ग्रेजी भाषा (English Language)",
    width: 0.40,
    category: 'el',
    color: const Color(0xFFB7A3FE),
  ),
  CustomInfoCardModel(
    height: 0.18,
    subtile: "400 Questions",
    title: " गणित (Mathematics / Arithmetic)",
    width: 0.40,
    category: 'ma',
    color: const Color(0xFF5BCECB),
  ),

  CustomInfoCardModel(
    height: 0.18,
    subtile: "2000 Questions",
    title: " तार्किक र मानसिक योग्यता (Logical and Mental Ability)",
    width: 0.40,
    category: 'lma',
    color: Color(0xFF67ACFF),
  ),
  CustomInfoCardModel(
    height: 0.18,
    subtile: "500 Questions",
    title: "संविधान, कानून र शासन व्यवस्था (शाखा अधिकृत स्तरका लागि)",
    width: 0.40,
    category: 'cc',
    color: const Color(0xFFB7A3FE),
  ),
  CustomInfoCardModel(
    height: 0.18,
    subtile: "400 Questions",
    title: " पदअनुसारको विषयगत प्रश्नहरू (Subject-Specific Questions)",
    width: 0.40,
    category: 'psq',
    color: const Color(0xFF5BCECB),
  ),
];
