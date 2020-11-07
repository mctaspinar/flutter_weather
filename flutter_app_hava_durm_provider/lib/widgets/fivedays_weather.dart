import 'package:flutter/material.dart';
import 'package:flutter_app_hava_durm_provider/models/weather.dart';

class FiveDaysWeather extends StatelessWidget {
  List<ConsolidatedWeather> consolidatedWeather;

  FiveDaysWeather(this.consolidatedWeather);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: consolidatedWeather.length - 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            int val = index + 1;
            return Column(
              children: [
                Text(consolidatedWeather[val].applicableDate.day.toString() +
                    "/" +
                    consolidatedWeather[val].applicableDate.month.toString()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    "https://www.metaweather.com/static/img/weather/png/" +
                        consolidatedWeather[val].weatherStateAbbr +
                        ".png",
                    height: 64,
                    width: 64,
                  ),
                ),
                Text(consolidatedWeather[val].theTemp.floor().toString() + "°C")
              ],
            );
          },
        ),
      ),
    );
  }
}
