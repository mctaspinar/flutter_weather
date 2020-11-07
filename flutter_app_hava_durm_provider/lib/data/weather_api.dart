import 'dart:convert';

import 'package:flutter_app_hava_durm_provider/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient{

  static const baseUrl = "https://www.metaweather.com/";
  final http.Client httpClient = http.Client();

  Future<int> getLocationID(String city) async{
    final cityUrl = "$baseUrl/api/location/search/?query=$city";
    final response = await httpClient.get(cityUrl);
    if(response.statusCode != 200){
      throw Exception("Veri Getirilemedi");
    }
    final responseJSON = (jsonDecode(response.body)) as List;
    return responseJSON[0]["woeid"];
  }

  Future<Weather> getWeather(int cityID) async{
    final weatherUrl = "$baseUrl/api/location/$cityID";
    final response = await httpClient.get(weatherUrl);
    if(response.statusCode != 200){
      throw Exception("Veri Getirilemedi");
    }
    final responseJSON = jsonDecode(response.body);
    return Weather.fromJson(responseJSON);
  }
}