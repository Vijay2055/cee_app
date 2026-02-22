class SubIndexModel {
  final String title;
  final String subtitle;
  final String category;

  SubIndexModel({required this.title, required this.subtitle,required this.category});
}

final listOfPhysicsIndex = [
  SubIndexModel(title: "Mechanics", subtitle: "subtitle",category: 'mechanics'),
  SubIndexModel(title: "Heat & Thermodynamics", subtitle: "subtitle",category: 'heat'),
  SubIndexModel(title: "Wave and Sound", subtitle: "subtitle",category: 'wave'),
  SubIndexModel(title: "Electric Field And Capacitor", subtitle: "subtitle",category: 'capacitor'),
  SubIndexModel(title: "Electricity and Magnetism", subtitle: "subtitle",category: 'magnetism'),
  SubIndexModel(title: "Modern Physics", subtitle: "subtitle",category: 'modern'),
];

final listOfChemistryIndex = [
  SubIndexModel(title: "Physical", subtitle: "subtitle",category: 'physical'),
  SubIndexModel(title: "Organic", subtitle: "subtitle",category: 'organic'),
  SubIndexModel(title: "Inorganic", subtitle: "subtitle", category: 'inorganic'),
];
