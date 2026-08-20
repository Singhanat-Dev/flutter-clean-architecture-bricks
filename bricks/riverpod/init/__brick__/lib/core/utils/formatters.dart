class AppFormatters {
  AppFormatters._();

  static String formatCurrency(num amount, {String symbol = '฿'}) {
    return '$symbol${amount.toStringAsFixed(2).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        )}';
  }
}
