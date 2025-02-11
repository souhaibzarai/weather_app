class Result {
  final String formattedAddress;

  Result({required this.formattedAddress});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      formattedAddress: json['formatted_address'] ?? 'Unknown Address',
    );
  }
}

class PlaceModel {
  final List<Result> results;

  PlaceModel({required this.results});

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      results: (json['results'] as List<dynamic>?)
              ?.map((item) => Result.fromJson(item))
              .toList() ??
          [],
    );
  }
}
