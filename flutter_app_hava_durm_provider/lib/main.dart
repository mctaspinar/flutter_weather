import 'package:flutter/material.dart';
import 'package:flutter_app_hava_durm_provider/service_locator.dart';
import 'package:flutter_app_hava_durm_provider/viewmodel/weather_view_model.dart';
import 'package:provider/provider.dart';
import 'widgets/weather_app.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hava Durumu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "Raleway"),
      home: ChangeNotifierProvider<WeatherVeiwModel>(
        create: (context) => locator<WeatherVeiwModel>(),
        child: WeatherApp(),
      ),
    );
  }
}
