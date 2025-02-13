class Weather {
  final String main;
  final String description;

  const Weather({required this.description, required this.main});

  factory Weather.fromJson(List<dynamic> json) {
    return Weather(
      description: json.first['description'],
      main: json.first['main'],
    );
  }
}
