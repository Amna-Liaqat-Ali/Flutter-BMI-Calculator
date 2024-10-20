import 'package:bmi_calculator_app/colors.dart';
import 'package:flutter/material.dart';

import '../Drawer/drawer.dart';
import '../app_bar.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBar(title: ''),
      drawer: CustomDrawer(),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildInfoTile(Icons.info_outline, 'What is BMI?',
              'Body Mass Index (BMI) is a measure calculated using your height and weight to determine whether you are underweight, normal weight, overweight, or obese. It’s a common tool used to assess overall body fat and health risks related to weight.'),
          Divider(),
          _buildInfoTile(Icons.calculate_outlined, 'How is BMI Calculated?',
              'BMI is calculated using the formula:\n\nBMI = weight (kg) / height² (m²)\n\nFor example, if your weight is 70 kg and your height is 1.75 meters, your BMI would be:\n\nBMI = 70 / (1.75 * 1.75) = 22.86'),
          Divider(),
          _buildInfoTile(Icons.category_outlined, 'BMI Categories',
              'BMI is classified into four main categories:\n\n- **Underweight**: BMI < 18.5\n- **Normal weight**: BMI 18.5 - 24.9\n- **Overweight**: BMI 25 - 29.9\n- **Obesity**: BMI ≥ 30\n\nEach category indicates a different health risk based on your body weight.'),
          Divider(),
          _buildInfoTile(
              Icons.health_and_safety_outlined,
              'Why is BMI Important?',
              'BMI is a useful screening tool for health risks related to weight, such as heart disease, diabetes, and hypertension. While it doesn’t directly measure body fat, it provides a general indication of whether your weight could be affecting your health.'),
          Divider(),
          _buildInfoTile(Icons.warning_outlined, 'Limitations of BMI',
              'While BMI is a useful tool, it doesn’t account for factors such as muscle mass, bone density, and fat distribution. For example, athletes may have a high BMI due to muscle mass but have low body fat. Similarly, BMI might not be accurate for older adults or children.'),
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String content) {
    return ExpansionTile(
      leading: Icon(icon, color: AppColors.backgroundPrimary),
      title: Text(title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.backgroundPrimary)),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(content, style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}
