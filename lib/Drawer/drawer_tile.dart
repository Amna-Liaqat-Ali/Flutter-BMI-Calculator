import 'package:bmi_calculator_app/Drawer/drawer_item.dart';
import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final DrawerItem drawerItem;

  DrawerTile({required this.drawerItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: drawerItem.icon,
      title: Text(drawerItem.title),
      onTap: () {
        Navigator.pushNamed(context, drawerItem.route);
      },
    );
  }
}
