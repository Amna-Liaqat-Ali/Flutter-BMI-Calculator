import 'package:bmi_calculator_app/colors.dart';
import 'package:flutter/material.dart';

import '../Drawer/drawer.dart';
import '../app_bar.dart';

class TreatmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBar(title: 'Treatments'),
      drawer: CustomDrawer(),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildCategoryCard(
              'Underweight',
              'BMI < 18.5',
              'assets/images/underweight.jpeg',
              'Treatment:\n- Increase calorie intake with nutrient-dense foods.\n- Consult a nutritionist for a tailored meal plan.\n- Regular strength training exercises.\n\n'
                  'Precautions:\n- Avoid empty calorie foods (junk food).\n- Stay hydrated.\n- Regular health checkups.'),
          _buildCategoryCard(
              'Normal Weight',
              'BMI 18.5 - 24.9',
              'assets/images/healthy.jpeg',
              'Treatment:\n- Maintain balanced diet with moderate exercise.\n- Regular cardiovascular and strength training exercises.\n\n'
                  'Precautions:\n- Monitor diet and physical activity regularly.\n- Avoid over-eating or extreme workouts.'),
          _buildCategoryCard(
              'Overweight',
              'BMI 25 - 29.9',
              'assets/images/overweight.jpeg',
              'Treatment:\n- Increase physical activity (30-60 minutes daily).\n- Consult with a dietitian for portion control.\n- Focus on cardiovascular exercises.\n\n'
                  'Precautions:\n- Avoid high-calorie, processed foods.\n- Regular blood pressure and cholesterol checks.'),
          _buildCategoryCard(
              'Obesity',
              'BMI ≥ 30',
              'assets/images/obseity.jpeg',
              'Treatment:\n- Consult with healthcare providers for a weight-loss plan.\n- Engage in regular physical activity (aerobics, strength training).\n- Consider behavioral therapy for lifestyle changes.\n\n'
                  'Precautions:\n- Monitor for diabetes, heart diseases, and other obesity-related conditions.\n- Avoid fad diets or extreme calorie restriction.'),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
      String category, String bmiRange, String imagePath, String details) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.cover),
            SizedBox(width: 16),
            // Text Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.backgroundPrimary)),
                  SizedBox(height: 5),
                  Text(bmiRange,
                      style:
                          TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                  SizedBox(height: 15),
                  Text(details, style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
