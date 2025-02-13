class Weather {
  final String main;
  final String description;

  const Weather({
    required this.main,
    required this.description,
  });

  factory Weather.fromJson(List<dynamic> json) {
    return Weather(
      main: json.first['main'],
      description: json.first['description'],
    );
  }
}
