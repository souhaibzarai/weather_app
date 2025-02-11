import '../models/address_model.dart';
import '../webservices/home_web_services.dart';

class HomeRepository {
  final HomeWebServices homeWebServices;

  const HomeRepository(this.homeWebServices);

  Future<PlaceModel> fetchCityName(double lat, double lng) async {
    final cityDetails = await homeWebServices.getCityDetails(lat, lng);

    return PlaceModel.fromJson(cityDetails);
  }
}
