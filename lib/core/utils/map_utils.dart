class MapUtil {
  static String calculateDistance(double? value) {
    if (value == null) return '-';
    return (value / 1000).toStringAsFixed(2);
  }

  static String calculateDuration(double? value) {
    if (value == null) return '-';
    return (value / 60).toStringAsFixed(2);
  }
}
