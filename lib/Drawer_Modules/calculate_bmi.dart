import 'package:bmi_calculator_app/app_bar.dart';
import 'package:bmi_calculator_app/colors.dart';
import 'package:flutter/material.dart';

import '../Drawer/drawer.dart';

class CalculatorBmi extends StatefulWidget {
  @override
  State<CalculatorBmi> createState() => _CalculatorBmiState();
}

class _CalculatorBmiState extends State<CalculatorBmi> {
  double _heightInCm = 170;
  int _weight = 70;
  int _age = 25;
  String _selectedGender = 'Male';
  double? _bmi;

  void calculateBMI() {
    // Convert height to meters
    double heightInMeters = _heightInCm / 100;

    if (heightInMeters > 0 && _weight > 0) {
      setState(() {
        _bmi = _weight / (heightInMeters * heightInMeters);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBar(title: 'Calculate BMI'),
      drawer: CustomDrawer(),
      body: Container(
        color: AppColors.teal100,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Gender selection buttons
                _buildInputContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildGenderButton('Male', Icons.male),
                      _buildGenderButton('Female', Icons.female),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                _buildInputContainer(
                  child: Column(
                    children: [
                      Text(
                        'Height (cm): ${_heightInCm.toStringAsFixed(0)}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 200,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Slider(
                            min: 120,
                            max: 220,
                            value: _heightInCm,
                            activeColor: AppColors.teal700,
                            inactiveColor: AppColors.teal200,
                            onChanged: (value) {
                              setState(() {
                                _heightInCm = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                _buildInputContainer(
                  child: Column(
                    children: [
                      Text(
                        'Age (years)',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (_age > 1) _age--;
                              });
                            },
                            icon: Icon(Icons.remove,
                                color: AppColors.backgroundPrimary),
                            iconSize: 30,
                          ),
                          Text(
                            '$_age',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _age++;
                              });
                            },
                            icon: Icon(Icons.add, color: AppColors.text),
                            iconSize: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                _buildInputContainer(
                  child: Column(
                    children: [
                      Text(
                        'Weight (kg)',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (_weight > 1) _weight--;
                              });
                            },
                            icon: Icon(Icons.remove,
                                color: AppColors.backgroundPrimary),
                            iconSize: 30,
                          ),
                          Text(
                            '$_weight',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _weight++;
                              });
                            },
                            icon: Icon(Icons.add,
                                color: AppColors.backgroundPrimary),
                            iconSize: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),

                ElevatedButton(
                  onPressed: calculateBMI,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: AppColors.teal700,
                  ),
                  child: Text(
                    'Calculate BMI',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.text,
                    ),
                  ),
                ),

                SizedBox(height: 30),

                if (_bmi != null)
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.teal50,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: AppColors.backgroundPrimary, width: 2),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Your BMI is:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.teal700,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          _bmi!.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        SizedBox(height: 10),
                        _buildBMICategory(),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Input Container
  Widget _buildInputContainer({required Widget child}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.text,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.backgroundPrimary.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  // Gender Selection Button
  Widget _buildGenderButton(String gender, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {
        setState(() {
          _selectedGender = gender;
        });
      },
      icon: Icon(icon,
          color: _selectedGender == gender
              ? AppColors.text
              : AppColors.backgroundPrimary),
      label: Text(
        gender,
        style: TextStyle(
          color: _selectedGender == gender
              ? AppColors.text
              : AppColors.backgroundPrimary,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: _selectedGender == gender
            ? AppColors.backgroundPrimary
            : AppColors.text,
        side: BorderSide(color: AppColors.backgroundPrimary, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  // Display BMI Category
  Widget _buildBMICategory() {
    String category;
    Color color;

    if (_bmi! < 18.5) {
      category = 'Underweight';
      color = AppColors.under_weight;
    } else if (_bmi! < 24.9) {
      category = 'Normal';
      color = AppColors.normal_weight;
    } else if (_bmi! < 29.9) {
      category = 'Overweight';
      color = AppColors.over_weight;
    } else {
      category = 'Obesity';
      color = AppColors.obseity;
    }

    return Text(
      category,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
