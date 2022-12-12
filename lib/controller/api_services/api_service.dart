import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapp/controller/api_constants/weather_api_constants.dart';
import 'package:weatherapp/model/weather_model.dart';

Future<WeatherModel> getWeatherData(String placeName) async {

  var url = Uri.parse('${WeatherApiConstants.baseUrl}&q=$placeName&aqi=no');
  var response = await http.get(url);
  // print(response.body);

  if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('apiResponse', response.body.toString());
 

    return weatherModelFromJson(response.body);
  }

  throw (response);
}
