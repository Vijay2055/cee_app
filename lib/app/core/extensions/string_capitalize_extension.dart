extension StringCapitalizeExtension on String {
  String get capitalFirst {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}
