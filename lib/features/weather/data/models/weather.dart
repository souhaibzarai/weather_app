class Weather {
  final String main;
  final String description;

  const Weather({required this.description, required this.main});
  
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      description: json['description'],
      main: json['main'],
    );
  }
}
