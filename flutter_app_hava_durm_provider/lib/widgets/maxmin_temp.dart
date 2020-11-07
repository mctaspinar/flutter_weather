import 'package:flutter/material.dart';
import 'package:flutter_app_hava_durm_provider/models/weather.dart';
import 'package:flutter_app_hava_durm_provider/viewmodel/weather_view_model.dart';
import 'package:provider/provider.dart';

class MaxMinTempWidget extends StatelessWidget {
  ConsolidatedWeather consolidatedWeather;
  MaxMinTempWidget(this.consolidatedWeather);


  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherVeiwModel>(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text("En yüksek : " +
                  consolidatedWeather.maxTemp
                      .floor()
                      .toString() +
                  "°C"),
            ),
            Text("En düşük : " +
                consolidatedWeather.minTemp
                    .floor()
                    .toString() +
                "°C"),
          ],
        ),
      ),
    );
  }
}
