import 'package:bmi_calculator_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // For social media icons
import 'package:url_launcher/url_launcher.dart';

import '../Drawer/drawer.dart';
import '../app_bar.dart'; // For launching URLs

class More extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBar(title: 'Contact Us'),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Get in Touch',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.backgroundPrimary)),
            SizedBox(height: 20),
            _buildContactItem(Icons.email, 'Email', 'support@bmicalculator.com',
                'mailto:support@bmicalculator.com'),
            Divider(),
            _buildContactItem(
                Icons.phone, 'Phone', '+1 234 567 890', 'tel:+1234567890'),
            Divider(),
            _buildContactItem(Icons.web, 'Website', 'www.bmicalculator.com',
                'https://www.bmicalculator.com'),
            Divider(),
            SizedBox(height: 20),
            Text('Follow Us',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.backgroundPrimary)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSocialButton(FontAwesomeIcons.facebook,
                    'https://www.facebook.com/bmicalculator'),
                _buildSocialButton(FontAwesomeIcons.twitter,
                    'https://twitter.com/bmicalculator'),
                _buildSocialButton(FontAwesomeIcons.linkedin,
                    'https://www.linkedin.com/in/bmicalculator'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to build contact items with icons
  Widget _buildContactItem(
      IconData icon, String label, String info, String url) {
    return InkWell(
      onTap: () async {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Row(
        children: [
          Icon(icon, color: AppColors.backgroundPrimary, size: 30),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              Text(info,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600])),
            ],
          ),
        ],
      ),
    );
  }

  // Function to build social media buttons with FontAwesome Icons
  Widget _buildSocialButton(IconData icon, String url) {
    return IconButton(
      icon: FaIcon(icon, size: 40, color: AppColors.backgroundPrimary),
      onPressed: () async {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
    );
  }
}
