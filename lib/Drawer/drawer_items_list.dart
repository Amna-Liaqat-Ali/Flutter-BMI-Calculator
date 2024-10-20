import 'package:flutter/material.dart';

import 'drawer_item.dart';

List<DrawerItem> drawerItems = [
  DrawerItem(icon: Icon(Icons.home_outlined), title: 'Home', route: '/home'),
  DrawerItem(
      icon: Icon(Icons.calculate_outlined),
      title: 'Calculate BMI',
      route: '/calculate'),
  DrawerItem(
      icon: Icon(Icons.medical_services),
      title: 'Treatment',
      route: '/treatment'),
  DrawerItem(
      icon: Icon(Icons.info_outlined), title: 'Information', route: '/info'),
  DrawerItem(icon: Icon(Icons.more), title: 'More', route: '/more'),
];
