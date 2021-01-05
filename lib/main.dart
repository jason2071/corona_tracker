import 'package:corona_tracker/pages/home/home_screen.dart';
import 'package:corona_tracker/routes.dart';
import 'package:corona_tracker/services/home_service.dart';
import 'package:corona_tracker/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => HomeService());
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
