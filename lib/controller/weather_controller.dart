import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapp/controller/api_services/api_find_ip.dart';
import 'package:weatherapp/model/weather_model.dart';


class WeatherController extends GetxController{

  late SharedPreferences sharedPreferences;
  WeatherModel? model;

@override
  void onInit() {
    fetchWeatherData();

    super.onInit();
  }

    void fetchWeatherData() async {
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (await getStringFromSF() == null) {
      model = await getIp();
    } else {
     model =  weatherModelFromJson(prefs.getString('apiResponse')!);
    }

   
  }

    getStringFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedModel = prefs.getString('apiResponse');
    // print(storedModel);
    return storedModel;
    
  }

      deleteStringFromSF() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('apiResponse');
      
    
  }




}