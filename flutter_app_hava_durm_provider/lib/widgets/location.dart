import 'package:flutter/material.dart';
import 'package:flutter_app_hava_durm_provider/models/weather.dart';

class LocationWidget extends StatelessWidget {
  Weather weatherResult;

  LocationWidget(this.weatherResult);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom : 5),
          child: Text(
            weatherResult.title,
            style: TextStyle(fontSize: 60),
          ),
        ),
        Text(
          weatherResult.time.day.toString() +
              "/" +
              weatherResult.time.month.toString() +
              "/" +
              weatherResult.time.year.toString() +
              " - " +
              TimeOfDay.fromDateTime(weatherResult.time.toLocal())
                  .format(context),
          style: TextStyle(fontSize: 16),
        ),
      ],
    ));
  }
}
