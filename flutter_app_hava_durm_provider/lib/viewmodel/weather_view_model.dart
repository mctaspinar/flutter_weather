import 'package:flutter/material.dart';
import 'package:flutter_app_hava_durm_provider/data/weather_repository.dart';
import 'package:flutter_app_hava_durm_provider/models/weather.dart';

import '../service_locator.dart';

enum WeatherState {
  InitialWeatherState,
  WeatherLoadingState,
  WeatherLoadedState,
  WeatherErrorState
}

class WeatherVeiwModel with ChangeNotifier {

  WeatherState _state;
  WeatherRepo _weatherRepo = locator<WeatherRepo>();
  Weather _weatherResult;
  Weather _weatherRefreshResult;

  WeatherVeiwModel(){
    _weatherResult = Weather();
    _state = WeatherState.InitialWeatherState;
  }


  Weather get weatherRefreshResult => _weatherRefreshResult;

  Weather get weatherResult => _weatherResult;

  WeatherState get state => _state;

  set state(WeatherState value) {
    _state = value;
    notifyListeners();
  }

  Future<Weather> getWeatherInfo(String cityName) async{
    try{
      state = WeatherState.WeatherLoadingState;
      _weatherResult = await _weatherRepo.getWeather(cityName);
      state = WeatherState.WeatherLoadedState;
      return _weatherResult;
    }catch(e){
      state = WeatherState.WeatherErrorState;
    }
  }

  Future<Weather> getRefreshedWeatherInfo(String cityName) async{
    try{
      _weatherResult = await _weatherRepo.getWeather(cityName);
      state = WeatherState.WeatherLoadedState;
      return _weatherResult;
    }catch(e){

    }
  }
}
