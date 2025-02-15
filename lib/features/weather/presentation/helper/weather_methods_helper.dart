class WeatherMethodsHelper {
  static String getTempCelsius(double tempK) {
    return (tempK - 273.15).toStringAsFixed(2);
  }
}
