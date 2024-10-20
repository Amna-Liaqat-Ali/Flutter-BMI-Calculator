import 'package:bmi_calculator_app/app_bar.dart';
import 'package:flutter/material.dart';

import '../Drawer/drawer.dart';
import '../colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBar(title: 'BMI Calculator'),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Icon(Icons.fitness_center,
                      size: 40, color: AppColors.backgroundPrimary),
                  title: Text(
                    'Your BMI Category',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Normal (22.0)',
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(Icons.check_circle,
                      color: AppColors.normal_weight, size: 30),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Health Tips',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.backgroundPrimary),
              ),
              SizedBox(height: 10),
              Card(
                elevation: 4,
                color: AppColors.teal50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Tip: Maintain a balanced diet with more vegetables and avoid sugary snacks for healthier BMI!',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Daily Goals',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.backgroundPrimary),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildGoalCard('Steps', '10,000', Icons.directions_walk),
                  _buildGoalCard('Water', '2L', Icons.local_drink),
                  _buildGoalCard('Sleep', '8H', Icons.bedtime),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Last Recorded BMI',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.backgroundPrimary),
              ),
              SizedBox(height: 10),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Icon(Icons.history,
                      size: 40, color: AppColors.backgroundPrimary),
                  title: Text(
                    'Last BMI: 22.0',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Recorded on: 12 Oct 2024',
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(Icons.arrow_forward,
                      color: AppColors.backgroundPrimary),
                  onTap: () {},
                ),
              ),
              SizedBox(height: 20),
              Text(
                'BMI Categories',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.backgroundPrimary,
                ),
              ),
              SizedBox(height: 10),
              Card(
                elevation: 4,
                color: AppColors.teal50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildBMICategory(
                          'Underweight', '< 18.5', AppColors.under_weight),
                      _buildBMICategory(
                          'Normal', '18.5 - 24.9', AppColors.normal_weight),
                      _buildBMICategory(
                          'Overweight', '25.0 - 29.9', AppColors.over_weight),
                      _buildBMICategory(
                          'Obesity', '30.0 and above', AppColors.obseity),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/calculate');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.backgroundPrimary,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Calculate BMI',
                    style: TextStyle(fontSize: 18, color: AppColors.text),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.text,
    );
  }

  Widget _buildBMICategory(String category, String range, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.circle, color: color, size: 20),
          SizedBox(width: 10),
          Text(
            '$category: $range',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalCard(String title, String value, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: AppColors.teal100,
      child: Container(
        height: 150,
        width: 100,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.teal.shade700),
            SizedBox(height: 10),
            Text(
              '$title: $value',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.backgroundPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
