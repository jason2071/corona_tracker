import 'package:corona_tracker/pages/home/home_screen.dart';
import 'package:corona_tracker/pages/selection/selection_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  SelectionScreen.routeName: (context) => SelectionScreen(),
};
