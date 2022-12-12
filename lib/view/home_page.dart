import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherapp/controller/api_services/api_find_ip.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? _model;
  RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    fetchWeatherData();
    super.initState();
  }

  void fetchWeatherData() async {
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (await getStringFromSF() == null) {
      _model = await getIp();
    } else {
     _model =  weatherModelFromJson(prefs.getString('apiResponse')!);
    }

    setState(() {});
  }

  getStringFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedModel = prefs.getString('apiResponse');
    return storedModel;
  }
    deleteStringFromSF() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('apiResponse');
      
    setState(() {
     
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.orange])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:

// _model==null ?const Center(child: SpinKitChasingDots(color: Color.fromARGB(255, 235, 57, 57))

// ):
// Center(child:Text(_model!.current.feelslikeF.toString()))

            SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: _model == null
                ? const Center(
                    child: SpinKitChasingDots(
                        color: Color.fromARGB(255, 235, 57, 57)))
                : Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                  child: Container(
                        width: 50,
                        height: 50,
                        
                        child: Icon(
                          Icons.refresh_outlined,
                                                    color: const Color(0xFFF3F2FB),

                          size: 50,
                        ),
                      ),
                      onTap: (){
                    deleteStringFromSF();

                      } ,
                ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                              Icons.location_on_outlined,
                              color: Color(0xFFF3F2FB),
                              size: 30,
                            ),
                          ),
                          Text(
                            _model!.location.name.toString(),
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 60),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                            child: Text(
                              "${_model!.current.tempC.toString().replaceAll(regex, '')}°",
                              style: const TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 115,
                              ),
                            ),
                          ),
                          Text(
                            _model!.current.condition.text.toString(),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFFF3F2FB),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 80,
                          child: Image.network(
                              'https:${_model!.current.condition.icon.toString()}'),),
                          
                        ],
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F2FB),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.grain,
                                    color: Color(0xFF808080),
                                    size: 24,
                                  ),
                                  Text(
                                    "${_model!.current.humidity.toString()}%",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF808080),
                                    ),
                                  ),
                                  Text(
                                    'Humidity',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF808080),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F2FB),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.sunny,
                                    color: Color(0xFF808080),
                                    size: 24,
                                  ),
                                  Text(
                                    ' ${_model!.current.uv.toString().replaceAll(regex, '')}',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF808080),
                                    ),
                                  ),
                                  Text(
                                    'U-V Index',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF808080),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F2FB),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.wind,
                                    color: Color(0xFF808080),
                                    size: 24,
                                  ),
                                  Text(
                                    ' ${_model!.current.windKph.toString()}Km/hr',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF808080),
                                    ),
                                  ),
                                  Text(
                                    'Wind',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF808080),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                       
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
