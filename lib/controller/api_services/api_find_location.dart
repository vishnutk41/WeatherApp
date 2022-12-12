import 'package:http/http.dart' as http;
import 'package:weatherapp/controller/api_services/api_service.dart';
import 'package:weatherapp/model/find_current_location_model.dart';
import 'package:weatherapp/model/weather_model.dart';

Future <WeatherModel> getLocation(String ip) async{
  


var url= Uri.parse('https://ipinfo.io/$ip/geo');
var response =await http.get(url);
// print(response.body);
if (response.statusCode==200) {
  FindPlaceNameModel userLocation = findPlaceNameModelFromJson(response.body);
  return getWeatherData(userLocation.city);
  // return UserLocation;
}else{
  throw(response.body);
}
}