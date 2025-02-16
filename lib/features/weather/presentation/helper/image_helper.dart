class ImageHelper {
  static String getImagePath(String main, String detail) {
    final weatherMain = main.toLowerCase();
    final weatherDetail = detail.toLowerCase();

    String? path;
    if (weatherMain == 'clear' && weatherDetail == 'clear sky') {
      path = 'sun.png';
    }
    if (weatherDetail.contains('snow')) {
      path = 'snow.png';
    }
    if (weatherDetail.contains(' rain') && !weatherDetail.contains('snow')) {
      path = 'soft_rain.png';
    }
    if (weatherMain.contains('clouds')) {
      if (weatherDetail.contains('few')) {
        path = 'few_clouds.png';
      }
      if (weatherDetail.contains('overcast')) {
        path = 'overcast_clouds.png';
      }
      if (weatherDetail.contains('scattered')) {
        path = 'scattered_clouds.png';
      }
      if (weatherDetail.contains('broken')) {
        path = 'broken_clouds.png';
      }
    }
    if (weatherMain.contains('mist') || weatherDetail.contains('mist')) {
      path = 'mist.png';
    }
    if (weatherDetail.contains('clear sky')) {
      path = 'clear.png';
    }
    return 'assets/images/weather_status/$path';
  }
}
