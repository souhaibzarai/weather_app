class Main {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;

  const Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMax,
    required this.tempMin,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'],
      feelsLike: json['feels_like'],
      tempMax: json['temp_max'],
      tempMin: json['temp_min'],
    );
  }
}
