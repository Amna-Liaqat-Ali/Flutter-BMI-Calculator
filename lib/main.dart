import 'package:flutter/material.dart';

import 'Drawer_Modules/Home_Screen.dart';
import 'Drawer_Modules/calculate_bmi.dart';
import 'Drawer_Modules/info.dart';
import 'Drawer_Modules/more.dart';
import 'Drawer_Modules/treatmentPage.dart';
import 'Splash_Screen.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/calculate': (context) => CalculatorBmi(),
        '/treatment': (context) => TreatmentPage(),
        '/info': (context) => InfoPage(),
        '/more': (context) => More()
      },
    );
  }
}
