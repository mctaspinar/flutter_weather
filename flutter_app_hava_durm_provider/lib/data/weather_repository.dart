import 'package:flutter_app_hava_durm_provider/data/weather_api.dart';
import 'package:flutter_app_hava_durm_provider/models/weather.dart';

import '../service_locator.dart';

class WeatherRepo{
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  Future<Weather> getWeather(String city) async{
    final int cityId = await weatherApiClient.getLocationID(city);
    return await weatherApiClient.getWeather(cityId);
  }

}