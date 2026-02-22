import 'package:flutter/material.dart';

class CourseContentItemModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final String category;
  final String? subCategory;

  const CourseContentItemModel({
    required this.category,
    required this.icon,
    required this.subtitle,
    required this.title,
    this.subCategory,
  });
}

final course_content_item_list = [
  CourseContentItemModel(
    category: 'ngk',
    subCategory: 'nepHis',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "नेपालको इतिहास",
  ),
  CourseContentItemModel(
    category: 'ngk',
    subCategory: 'nepGeo',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "नेपालको भूगोल",
  ),
  CourseContentItemModel(
    category: 'ngk',
    subCategory: 'nepPol',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "संविधान, राजनीति र शासन प्रणाली",
  ),
  CourseContentItemModel(
    category: 'ngk',
    subCategory: 'nepFes',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "राष्ट्रिय चाडपर्व, सांस्कृतिक सम्पदा",
  ),
  CourseContentItemModel(
    category: 'ngk',
    subCategory: "nepEvents",
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "प्रमुख राष्ट्रिय घटनाहरू",
  ),
  CourseContentItemModel(
    category: 'igk',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "विश्व भूगोल",
  ),
  CourseContentItemModel(
    category: 'igk',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "अन्तर्राष्ट्रिय संघ-संस्थाहरू (जस्तै: UN, SAARC आदि)",
  ),
  CourseContentItemModel(
    category: 'igk',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "विश्वका प्रमुख घटनाहरू",
  ),
  CourseContentItemModel(
    category: 'ca',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "राष्ट्रिय तथा अन्तर्राष्ट्रिय ताजा समाचार",
  ),
  CourseContentItemModel(
    category: 'ca',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "सरकारी योजना तथा कार्यक्रमहरू",
  ),
  CourseContentItemModel(
    category: 'ca',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "खेलकुद, पुरस्कार, नियुक्तिहरू",
  ),
  CourseContentItemModel(
    category: 'ca',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "आर्थिक तथा सामाजिक परिवर्तन",
  ),
  CourseContentItemModel(
    category: 'nl',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "व्याकरण",
  ),
  CourseContentItemModel(
    category: 'nl',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "पर्यायवाची/विपरीतार्थी शब्दहरू",
  ),
  CourseContentItemModel(
    category: 'nl',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "उखान टुक्का",
  ),
  CourseContentItemModel(
    category: 'nl',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "वाक्य सुधार",
  ),
  CourseContentItemModel(
    category: 'nl',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "अपठित गद्यांश (Reading Comprehension)",
  ),
  CourseContentItemModel(
    category: 'el',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "Grammar (Tense, Article, Preposition आदि)",
  ),
  CourseContentItemModel(
    category: 'el',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "Vocabulary",
  ),
  CourseContentItemModel(
    category: 'el',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "Synonyms/Antonyms",
  ),
  CourseContentItemModel(
    category: 'el',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "Sentence Correction",
  ),
  CourseContentItemModel(
    category: 'el',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "Reading Comprehension",
  ),
  CourseContentItemModel(
    category: 'ma',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "संख्या प्रणाली",
  ),
  CourseContentItemModel(
    category: 'ma',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "लसाप्र/मसाप्र",
  ),
  CourseContentItemModel(
    category: 'ma',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "अनुपात र समानुपात",
  ),
  CourseContentItemModel(
    category: 'ma',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "नाफा-नोक्सान",
  ),
  CourseContentItemModel(
    category: 'ma',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "ब्याज (साधारण र मिश्रित)",
  ),
  CourseContentItemModel(
    category: 'ma',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "समय र काम",
  ),
  CourseContentItemModel(
    category: 'ma',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "प्रतिशत",
  ),
  CourseContentItemModel(
    category: 'ma',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "औसत",
  ),
  CourseContentItemModel(
    category: 'ma',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "गति, समय, दूरी",
  ),
  CourseContentItemModel(
    category: 'ma',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "गणनाको सरल तरिका (Simplification)",
  ),
  CourseContentItemModel(
    category: 'lma',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "शृङ्खला (Series - Number/Alphabet)",
  ),
  CourseContentItemModel(
    category: 'lma',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "कोडिङ-डिकोडिङ",
  ),
  CourseContentItemModel(
    category: 'lma',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "रक्तसम्बन्ध (Blood Relation)",
  ),
  CourseContentItemModel(
    category: 'lma',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "दिशा परीक्षण (Direction Test)",
  ),
  CourseContentItemModel(
    category: 'lma',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "पजल समाधान",
  ),
  CourseContentItemModel(
    category: 'lma',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "Venn Diagram",
  ),
  CourseContentItemModel(
    category: 'lma',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "उपमा (Analogy)",
  ),
  CourseContentItemModel(
    category: 'lma',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "निर्णय र निष्कर्ष (Statement & Conclusion)",
  ),
  CourseContentItemModel(
    category: 'cc',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "नेपालको संविधान",
  ),
  CourseContentItemModel(
    category: 'cc',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "मौलिक हक र कर्तव्यहरू",
  ),
  CourseContentItemModel(
    category: 'cc',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "संघीय शासन प्रणाली",
  ),
  CourseContentItemModel(
    category: 'cc',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "तीन तहको सरकार (संघ, प्रदेश, स्थानीय)",
  ),
  CourseContentItemModel(
    category: 'cc',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "न्याय प्रणाली",
  ),
  CourseContentItemModel(
    category: 'cc',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "प्रशासकीय संरचना",
  ),
  CourseContentItemModel(
    category: 'psq',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "विषयगत सिद्धान्त",
  ),
  CourseContentItemModel(
    category: 'psq',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "प्राविधिक ज्ञान",
  ),
  CourseContentItemModel(
    category: 'psq',
    icon: Icons.security_outlined,
    subtitle: "Subtitle",
    title: "व्यवहारिक प्रयोगहरू",
  ),
];
