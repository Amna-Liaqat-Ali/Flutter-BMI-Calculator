import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'Drawer_Modules/Home_Screen.dart';
import 'colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: AppColors.backgroundPrimary,
      duration: 2000, //time is in miliseconds(2 seconds)
      splash: Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/logo.png'),
          radius: 100,
          backgroundColor: AppColors.logo,
        ),
      ),
      nextScreen: HomeScreen(),
      splashTransition: SplashTransition.scaleTransition,
    );
  }
}
