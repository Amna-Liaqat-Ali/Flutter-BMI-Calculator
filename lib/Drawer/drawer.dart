import 'package:flutter/material.dart';

import '../colors.dart';
import 'drawer_items_list.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatefulWidget {
  @override
  State<CustomDrawer> createState() => _DrawerState();
}

class _DrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            color: AppColors.backgroundPrimary,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  'Stay Fit, Stay Healthy',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: drawerItems.length,
              itemBuilder: (context, index) {
                return DrawerTile(drawerItem: drawerItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
