// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'package:weatherapp/controller/api_services/api_find_location.dart';
import 'package:weatherapp/model/find_ip_model.dart';
import 'package:weatherapp/model/weather_model.dart';

Future <WeatherModel> getIp() async{
var url= Uri.parse('https://api.ipify.org/?format=json');
var response =await http.get(url);
if (response.statusCode==200) {
  FindCurrentIpModel UserIP = findCurrentIpModelFromJson(response.body);
 return getLocation(UserIP.ip);
}else{
  throw(response.body);
}
}