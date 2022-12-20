// ignore_for_file: depend_on_referenced_packages, unnecessary_const

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:weatherapp/view/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return AnimatedSplashScreen(
       
animationDuration: const Duration(seconds: 3),
     
      splash:const Center(child: const Text("Lilac Flutter Assignment",
      style: const TextStyle(
        fontSize: 20,
        color: Colors.white
      ),)),
      backgroundColor: Colors.purple,
      nextScreen: HomePage(),
      
      splashIconSize: 360,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}