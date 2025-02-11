class Coord {
  final double lat;
  final double lng;

  const Coord({required this.lat, required this.lng});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lat: double.parse(json['lat']),
      lng: double.parse(json['lon']),
    );
  }
}
