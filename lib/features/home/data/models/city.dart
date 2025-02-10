class City {
  late Address address;

  City.fromJson(Map<String, dynamic> json) {
    address = Address.fromJson(json['address']);
  }
}

class Address {
  late String city;
  late String region;
  late String country;

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    region = json['region'];
    country = json['country'];
  }
}
