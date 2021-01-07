import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class GetLocation{
  double latitude;
  double longitude;
  String city;
  //Get current Location
  Future<void> getCurrentLocation() async{
    try{
      Position location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = location.latitude;
      longitude = location.longitude;


      city = await getCityName(location.latitude, location.longitude);
    }

    catch(e){
      print(e);
    }
  }

  //Get city name
  Future<String> getCityName(double lat, double lon) async{
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    return placemark[0].locality;
  }
}