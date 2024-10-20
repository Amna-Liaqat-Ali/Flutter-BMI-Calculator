import 'package:bmi_calculator_app/colors.dart';
import 'package:flutter/material.dart';

class CustomBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomBar({required this.title});

  @override
  Size get preferredSize => Size.fromHeight(80);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: Colors.teal,
      iconTheme: IconThemeData(color: AppColors.text),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20.0), top: Radius.circular(20.0)),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: AppColors.text,
          letterSpacing: 2.0,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.info_outline),
          onPressed: () {},
          tooltip: 'Info',
        ),
      ],
    );
  }
}
