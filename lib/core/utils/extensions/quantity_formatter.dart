extension QuantityFormatter on String? {
  String formatQuantity() {
    if (this == null || this!.isEmpty) return '';

    final number = double.tryParse(this!);
    if (number == null) return this!;
    if (number % 1 == 0) {
      return number.toInt().toString();
    } else {
      return number.toString();
    }
  }
}
