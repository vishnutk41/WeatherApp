import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherapp/controller/weather_controller.dart';


// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  WeatherController controller = Get.put(WeatherController());
  RegExp regex = RegExp(r"([.]*0+)(?!.*\d)");

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

            SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: controller.model == null
                ? const Center(
                    child: SpinKitChasingDots(
                        color: Color.fromARGB(255, 235, 57, 57)))
                : Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                     
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                              Icons.location_on_outlined,
                              color: Color(0xFFF3F2FB),
                              size: 30,
                            ),
                          ),
                          Text(
                            controller.model!.location.name.toString(),
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 60),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                            child: Text(
                              "${controller.model!.current.tempC.toString().replaceAll(regex, '')}°",
                              style: const TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 115,
                              ),
                            ),
                          ),
                          Text(
                            controller.model!.current.condition.text.toString(),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFFF3F2FB),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 80,
                          child: Image.network(
                                'https:${controller.model!.current.condition.icon.toString()}'),
                          ),
                          
                        ],
                      ),
                      const SizedBox(height: 30),
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
                                  const Icon(
                                    Icons.grain,
                                    color: Color(0xFF808080),
                                    size: 24,
                                  ),
                                  Text(
                                    "${controller.model!.current.humidity.toString()}%",
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF808080),
                                    ),
                                  ),
                                  const Text(
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
                                  const Icon(
                                    Icons.sunny,
                                    color: Color(0xFF808080),
                                    size: 24,
                                  ),
                                  Text(
                                    ' ${controller.model!.current.uv.toString().replaceAll(regex, '')}',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF808080),
                                    ),
                                  ),
                                  const Text(
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
                                  const FaIcon(
                                    FontAwesomeIcons.wind,
                                    color: Color(0xFF808080),
                                    size: 24,
                                  ),
                                  Text(
                                    ' ${controller.model!.current.windKph.toString()}Km/hr',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF808080),
                                    ),
                                  ),
                                  const Text(
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
                      const SizedBox(
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
