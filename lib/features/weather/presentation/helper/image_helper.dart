class ImageHelper {
  static String getImagePath(String main, String detail) {
    final weatherMain = main.toLowerCase();
    final weatherDetail = detail.toLowerCase();

    if (weatherMain == 'clear' && weatherDetail == 'clear sky') {
      return 'sun.png';
    }
    if (weatherDetail.contains('snow')) {
      return 'snow.png';
    }
    if (weatherDetail.contains(' rain')) {
      return 'soft_rain.png';
    }
    if (weatherMain == 'clouds') {
      if (weatherDetail.contains('few')) {
        return 'few_clouds.png';
      }
      if (weatherDetail.contains('overcast')) {
        return 'overcast_clouds.png';
      }
      if (weatherDetail.contains('scattered')) {
        return 'scattered_clouds.png';
      }
      if (weatherDetail.contains('broken')) {
        return 'broken_clouds.png';
      }
    }
    return 'sun.png';
  }
}
